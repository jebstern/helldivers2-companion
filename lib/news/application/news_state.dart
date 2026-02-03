import "package:freezed_annotation/freezed_annotation.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../domain/news_article.dart";

part "news_state.freezed.dart";

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    required AsyncState<bool> status,
    @Default(<NewsArticle>[]) List<NewsArticle> news,
    @Default(1) int currentPage,
    @Default(1) int pages,
  }) = _NewsState;

  factory NewsState.empty() =>
      NewsState(news: <NewsArticle>[], status: AsyncState<bool>.data(false));
}
