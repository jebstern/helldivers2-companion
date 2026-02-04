// ignore_for_file: lines_longer_than_80_chars

import "dart:async";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:fpdart/fpdart.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../../core/constants/constants.dart";
import "../../core/domain/i_shared_preferences_repository.dart";
import "../../core/utils/hd_logger.dart";
import "../../main.dart";
import "../domain/news_article.dart";
import "news_state.dart";

/// A controller that manages the news state of the application.
///
/// It listens to news updates from Firebase Firestore and handles pagination.
class NewsController {
  /// Creates a [NewsController] and starts listening to news updates.
  NewsController() {
    _sharedPreferencesRepository = di<ISharedPreferencesRepository>();

    _listenToNewsUpdates();
  }

  final FlutterSignal<NewsState> state = signal<NewsState>(NewsState.empty());
  late final ISharedPreferencesRepository _sharedPreferencesRepository;

  void _listenToNewsUpdates() {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    final CollectionReference<Map<String, dynamic>> newsCollection = db
        .collection("news");
    newsCollection.snapshots().listen(
      (QuerySnapshot<Map<String, dynamic>> event) {
        List<NewsArticle> newsArticles = <NewsArticle>[];

        final List<Map<String, dynamic>> documents = event.docs.map((
          QueryDocumentSnapshot<Map<String, dynamic>> e,
        ) {
          final Map<String, dynamic> data = e.data();
          data["id"] = e.id;
          return data;
        }).toList();

        for (final Map<String, dynamic> element in documents) {
          Timestamp timestamp;
          DateTime date = DateTime.now();
          String title = "";
          String text = "";
          String imagePath = "";
          String id = "";

          try {
            timestamp = element["date"] as Timestamp;
            date = timestamp.toDate();
            title = element["title"] as String;
            text = element["text"] as String;
            imagePath = element["imagePath"] as String;
            id = element["id"] as String;
          } catch (error) {
            hdLogger.warning(
              "Error parsing data:"
                  r' (element["date"]: ${element["date"]}),',
              r' (element["title"]: ${element["title"]}),'
                  r' (element["text"]: ${element["text"]}),'
                  r' (element["imagePath"]: ${element["imagePath"]})'
                  r' (element["id"]: ${element["id"]}).'
                  r" Error: $error",
            );
          }

          bool read = false;
          if (title.isNotEmpty) {
            final String? hasRead = _sharedPreferencesRepository.read(title);

            read = hasRead != null;
          }

          newsArticles.add(
            NewsArticle(
              date: date,
              title: title,
              text: text,
              imagePath: imagePath,
              read: read,
              id: id,
            ),
          );
        }

        newsArticles = _sortNewsByDate(newsArticles);
        _updateState(newsArticles);
      },
      onError: (Object? error) {
        hdLogger.severe(r"Error fetching news: $error");
      },
    );
  }

  List<NewsArticle> _sortNewsByDate(List<NewsArticle> newsArticles) {
    final List<NewsArticle> sorted = newsArticles
        .sortWithDate((NewsArticle instance) => instance.date)
        .reversed
        .toList();

    return sorted;
  }

  void _updateState(List<NewsArticle> newsArticles) {
    bool newArticles = false;
    if (state.value.news.isNotEmpty) {
      newArticles = newsArticles.length != state.value.news.length;
    }

    if (newArticles) {
      hdLogger.shout("New articles detected!");
    }

    state.value = state.value.copyWith(
      news: newsArticles,
      pages: (newsArticles.length / maxItemsPerPage).ceil(),
    );
  }

  /// Updates the current page index.
  void onPageChanged(int page) {
    if (page == state.value.currentPage) {
      return;
    }

    if (page < 1) {
      return;
    }

    state.value = state.value.copyWith(currentPage: page);
  }

  /// Returns the list of [NewsArticle] for the current page based on pagination.
  List<NewsArticle> getCurrentPageItems() {
    final int startIndex = (state.value.currentPage - 1) * maxItemsPerPage;
    final int endIndex = (startIndex + maxItemsPerPage).clamp(
      0,
      state.value.news.length,
    );

    return state.value.news.sublist(startIndex, endIndex);
  }

  /// Marks a [NewsArticle] as read and persists this status.
  void markAsRead(NewsArticle article) {
    if (article.read) {
      return;
    }

    unawaited(
      _sharedPreferencesRepository.write(
        article.title,
        DateTime.now().toIso8601String(),
      ),
    );

    state.value = state.value.copyWith(
      news: state.value.news.map((NewsArticle e) {
        if (e.title == article.title) {
          return e.copyWith(read: true);
        } else {
          return e;
        }
      }).toList(),
    );
  }
}
