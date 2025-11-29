// ignore_for_file: lines_longer_than_80_chars

import "dart:async";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:fpdart/fpdart.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/constants/constants.dart";
import "../../core/providers.dart";
import "../../core/utils/hd_logger.dart";
import "../domain/news_article.dart";
import "news_state.dart";

part "news_controller.g.dart";

@riverpod
class NewsController extends _$NewsController {
  @override
  NewsState build() {
    _listenToNewsUpdates();

    return const NewsState();
  }

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
                  ' (element["date"]: ${element["date"]}),',
              ' (element["title"]: ${element["title"]}),'
                  ' (element["text"]: ${element["text"]}),'
                  ' (element["imagePath"]: ${element["imagePath"]})'
                  ' (element["id"]: ${element["id"]}).'
                  " Error: $error",
            );
          }

          bool read = false;
          if (title.isNotEmpty) {
            final String? hasRead = ref
                .read(sharedPreferencesRepositoryProvider)
                .read(title);

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
        hdLogger.severe("Error fetching news: $error");
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
    if (state.news.isNotEmpty) {
      newArticles = newsArticles.length != state.news.length;
    }

    hdLogger.shout("newArticles: $newArticles");

    state = state.copyWith(
      news: newsArticles,
      pages: (newsArticles.length / maxItemsPerPage).ceil(),
    );
  }

  void onPageChanged(int page) {
    if (page == state.currentPage) {
      return;
    }

    if (page < 1) {
      return;
    }

    state = state.copyWith(currentPage: page);
  }

  List<NewsArticle> getCurrentPageItems() {
    final int startIndex = (state.currentPage - 1) * maxItemsPerPage;
    final int endIndex = (startIndex + maxItemsPerPage).clamp(
      0,
      state.news.length,
    );

    return state.news.sublist(startIndex, endIndex);
  }

  void markAsRead(NewsArticle article) {
    if (article.read) {
      return;
    }

    unawaited(
      ref
          .read(sharedPreferencesRepositoryProvider)
          .write(article.title, DateTime.now().toIso8601String()),
    );

    state = state.copyWith(
      news: state.news.map((NewsArticle e) {
        if (e.title == article.title) {
          return e.copyWith(read: true);
        } else {
          return e;
        }
      }).toList(),
    );
  }
}
