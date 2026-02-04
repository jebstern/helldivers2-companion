import "package:freezed_annotation/freezed_annotation.dart";

part "news_article.freezed.dart";

/// Represents a news article in the application.
@freezed
abstract class NewsArticle with _$NewsArticle {
  /// Default factory constructor for [NewsArticle].
  ///
  /// Represents a single piece of news with metadata and read status.
  factory NewsArticle({
    /// The date when the article was published.
    DateTime? date,

    /// The title of the news article.
    String? title,

    /// The body content of the article.
    String? text,

    /// A path or URL to the article's representative image.
    String? imagePath,

    /// Whether the user has read this article.
    bool? read,

    /// Unique identifier for the article.
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

  /// Named constructor for [NewsArticle] with required fields and defaults.
  factory NewsArticle.def({
    required DateTime date,
    @Default("") String title,
    @Default("") String text,
    @Default("") String imagePath,
    @Default(false) bool read,
    @Default("") String id,
  }) = _NewsArticle;
}
