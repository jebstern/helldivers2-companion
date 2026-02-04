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
    if (newsState.status.isLoading) {
      return const _NewsLoading();
    } else if (newsState.status.hasError) {
      return _NewsError(error: newsState.status.error.toString());
    } else if (newsState.news.isEmpty) {
      return const _NewsEmpty();
    } else {
      return _NewsList(
        articles: controller.getCurrentPageItems(),
        onArticleTap: (NewsArticle article) {
          controller.markAsRead(article);
          unawaited(
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    NewsArticlePage(newsArticle: article),
              ),
            ),
          );
        },
      );
    }
  }
}

class _NewsLoading extends StatelessWidget {
  const _NewsLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _NewsError extends StatelessWidget {
  const _NewsError({required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Error: $error",
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

class _NewsEmpty extends StatelessWidget {
  const _NewsEmpty();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No news available."));
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({required this.articles, required this.onArticleTap});

  final List<NewsArticle> articles;
  final void Function(NewsArticle) onArticleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: articles.map((NewsArticle e) {
        return NewsCard(
          newsArticle: e,
          onTap: () => onArticleTap(e),
        );
      }).toList(),
    );
  }
}
