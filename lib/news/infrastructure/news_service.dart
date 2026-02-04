import "package:cloud_firestore/cloud_firestore.dart";
import "package:fpdart/fpdart.dart";

import "../../core/domain/failures.dart";
import "../domain/news_article.dart";

class NewsService {
  NewsService._() : db = FirebaseFirestore.instance;

  static final NewsService instance = NewsService._();

  final FirebaseFirestore db;

  Future<Either<Failure, List<NewsArticle>>> fetchNews() async {
    final List<NewsArticle> news = <NewsArticle>[];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await db
          .collection("news")
          .get();

      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
          in snapshot.docs) {
        final Map<String, dynamic> data = doc.data();

        // validate required fields and types
        if (data["date"] is! Timestamp ||
            data["title"] is! String ||
            data["text"] is! String ||
            data["imagePath"] is! String) {
          continue; // skip malformed documents
        }

        final Timestamp timestamp = data["date"] as Timestamp;
        final DateTime date = timestamp.toDate();

        news.add(
          NewsArticle(
            date: date,
            title: data["title"] as String,
            text: data["text"] as String,
            imagePath: data["imagePath"] as String,
          ),
        );
      }

      return right(news);
    } catch (error, _) {
      return left(Failure.exception(error.toString()));
    }
  }
}
