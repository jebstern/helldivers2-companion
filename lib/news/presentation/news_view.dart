import "dart:async";

import "package:flutter/material.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../../core/presentation/base_view.dart";
import "../../main.dart" show di;
import "../application/news_controller.dart";
import "../application/news_state.dart";
import "../domain/news_article.dart";
import "news_article_page.dart";
import "news_greeting.dart";
import "news_list.dart";
import "news_widgets.dart";
import "pagination.dart";

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController controller = di<NewsController>();

    return BaseView(
      child: Watch((BuildContext context) {
        final NewsState newsState = controller.state.watch(context);

        return Column(
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
        );
      }),
    );
  }

  Widget _buildBody(
    BuildContext context,
    NewsController controller,
    NewsState newsState,
  ) {
    if (newsState.status.isLoading) {
      return const NewsLoading();
    } else if (newsState.status.hasError) {
      return NewsError(error: newsState.status.error.toString());
    } else if (newsState.news.isEmpty) {
      return const NewsEmpty();
    } else {
      return NewsList(
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



