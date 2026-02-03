import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../core/presentation/base_view.dart";
import "../application/news_controller.dart";
import "../application/news_state.dart";
import "../domain/news_article.dart";
import "news_article_page.dart";
import "news_card.dart";
import "news_greeting.dart";
import "pagination.dart";

class NewsView extends ConsumerWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NewsState newsState = ref.watch(newsControllerProvider);

    return BaseView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const NewsGreeting(),
          const SizedBox(height: 32),
          _buildBody(context, ref),
          const SizedBox(height: 32),
          ResponsivePagination(
            totalPages: newsState.pages,
            currentPage: newsState.currentPage,
            onPageChanged: (int page) {
              ref.read(newsControllerProvider.notifier).onPageChanged(page);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final NewsState newsState = ref.watch(newsControllerProvider);
    final List<NewsArticle> currentPageItems =
        ref.read(newsControllerProvider.notifier).getCurrentPageItems();

    if (newsState.status.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (newsState.status.hasError) {
      return Center(
        child: Text(
          "Error: ${newsState.status.error}",
          style: const TextStyle(color: Colors.red),
        ),
      );
    } else if (newsState.news.isEmpty) {
      return const Center(child: Text("No news available."));
    } else {
      return Column(
        spacing: 32,
        children: currentPageItems.map((NewsArticle e) {
          return NewsCard(
            newsArticale: e,
            onTap: () {
              ref.read(newsControllerProvider.notifier).markAsRead(e);

              unawaited(
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        NewsArticlePage(newsArticle: e),
                  ),
                ),
              );
            },
          );
        }).toList(),
      );
    }
  }
}
