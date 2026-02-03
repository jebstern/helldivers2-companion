import "dart:async";
import "dart:math";

import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";

import "../../core/constants/titles_repository.dart";
import "../../core/presentation/base_view.dart";
import "../../main.dart" show di;
import "../../settings/application/settings_controller.dart";
import "../../titles/domain/player_title.dart";
import "../application/news_controller.dart";
import "../application/news_state.dart";
import "../domain/news_article.dart";
import "news_article_page.dart";
import "news_card.dart";
import "pagination.dart";

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  static const List<String> _greetings = <String>[
    "Welcome",
    "Hail",
    "Greetings",
    "Salutations",
    "Good to see you",
    "Well met",
    "Attention",
    "All honor to you",
    "Glory to you",
    "Respect",
    "Reporting in",
    "At your service",
    "Rise,",
    "Stand proud",
    "Victory awaits",
  ];

  String _greeting = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _greeting = getRandomGreeting();
    });
  }

  @override
  Widget build(BuildContext context) {
    final NewsController controller = di<NewsController>();
    final NewsState newsState = controller.state.value;
    final FTypography typography = context.theme.typography;

    return BaseView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AutoSizeText(
            _getGreeting(),
            maxLines: 1,
            style: typography.xl5,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _buildBody(),
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

  Widget _buildBody() {
    final NewsController controller = di<NewsController>();
    final NewsState newsState = controller.state.value;
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
            newsArticale: e,
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

  PlayerTitle? _getCurrentTitle() {
    final SettingsController controller = di<SettingsController>();

    final int playerLevel = controller.state.value.level;

    return TitlesRepository.playerTitles
        .where((PlayerTitle t) => t.level != null && t.level! <= playerLevel)
        .reduce((PlayerTitle a, PlayerTitle b) => a.level! > b.level! ? a : b);
  }

  String getRandomGreeting() {
    final Random random = Random();
    final String greeting = _greetings[random.nextInt(_greetings.length)];
    return greeting;
  }

  String _getGreeting() {
    final String title = _getCurrentTitle()?.title ?? "None";
    return "$_greeting $title!";
  }
}
