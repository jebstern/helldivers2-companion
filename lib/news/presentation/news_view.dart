import "dart:async";
import "dart:math";

import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:forui/forui.dart";

import "../../core/constants/titles_repository.dart";
import "../../core/presentation/base_view.dart";
import "../../settings/application/settings_controller.dart";
import "../../titles/domain/player_title.dart";
import "../application/news_controller.dart";
import "../application/news_state.dart";
import "../domain/news_article.dart";
import "news_article_page.dart";
import "news_card.dart";
import "pagination.dart";

class NewsView extends ConsumerStatefulWidget {
  const NewsView({super.key});

  @override
  ConsumerState<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<NewsView> {
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
    final NewsState newsState = ref.watch(newsControllerProvider);
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
            onPageChanged: (int page) {
              ref.read(newsControllerProvider.notifier).onPageChanged(page);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final NewsState newsState = ref.watch(newsControllerProvider);
    final List<NewsArticle> currentPageItems = ref
        .read(newsControllerProvider.notifier)
        .getCurrentPageItems();

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

  PlayerTitle? _getCurrentTitle() {
    final int playerLevel = ref.watch(settingsControllerProvider).level;

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
