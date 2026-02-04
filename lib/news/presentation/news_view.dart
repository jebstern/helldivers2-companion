import "dart:async";

import "package:flutter/material.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../../core/presentation/base_view.dart";
import "../../main.dart" show di;
import "../application/news_controller.dart";
import "../application/news_state.dart";
import "../domain/news_article.dart";
import "news_article_page.dart";
import "news_card.dart";
import "news_greeting.dart";
import "pagination.dart";

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController controller = di<NewsController>();
    final NewsState newsState = controller.state.watch(context);

    return BaseView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const NewsGreeting(),
          const SizedBox(height: 32),
          _buildBody(context, controller, newsState),
          const SizedBox(height: 32),
          ResponsivePagination(
            totalPages: newsState.pages,
            currentPage: newsState.currentPage,
            onPageChanged: controller.onPageChanged,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    NewsController controller,
    NewsState newsState,
  ) {
    final List<NewsArticle> currentPageItems = controller.getCurrentPageItems();

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
            newsArticle: e,
            onTap: () {
              controller.markAsRead(e);

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
