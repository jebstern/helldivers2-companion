import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "../domain/news_article.dart";

part "news_state.freezed.dart";

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    @Default(<NewsArticle>[]) List<NewsArticle> news,
    @Default(AsyncValue<bool>.data(false)) AsyncValue<bool> status,
    @Default(1) int currentPage,
    @Default(1) int pages,
  }) = _NewsState;
}
