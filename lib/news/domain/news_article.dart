import "package:freezed_annotation/freezed_annotation.dart";

part "news_article.freezed.dart";

/// Represents a news article in the application.
@freezed
abstract class NewsArticle with _$NewsArticle {
  /// Default factory constructor for [NewsArticle].
  factory NewsArticle({
    DateTime? date,
    String? title,
    String? text,
    String? imagePath,
    bool? read,
    String? id,
  }) {
    return _NewsArticle(
      date: date ?? DateTime.now(),
      title: title ?? "",
      text: text ?? "",
      imagePath: imagePath ?? "",
      read: read ?? false,
      id: id ?? "",
    );
  }
  factory NewsArticle.def({
    required DateTime date,
    @Default("") String title,
    @Default("") String text,
    @Default("") String imagePath,
    @Default(false) bool read,
    @Default("") String id,
  }) = _NewsArticle;
}
