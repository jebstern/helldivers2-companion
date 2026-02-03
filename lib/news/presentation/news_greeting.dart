import "dart:math";

import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:forui/forui.dart";

import "../../core/constants/titles_repository.dart";
import "../../settings/application/settings_controller.dart";
import "../../titles/domain/player_title.dart";

class NewsGreeting extends ConsumerStatefulWidget {
  const NewsGreeting({super.key});

  @override
  ConsumerState<NewsGreeting> createState() => _NewsGreetingState();
}

class _NewsGreetingState extends ConsumerState<NewsGreeting> {
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

  late final String _greeting;

  @override
  void initState() {
    super.initState();
    _greeting = _getRandomGreeting();
  }

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;
    return AutoSizeText(
      _getGreeting(),
      maxLines: 1,
      style: typography.xl5,
      textAlign: TextAlign.center,
    );
  }

  PlayerTitle? _getCurrentTitle() {
    final int playerLevel = ref.watch(settingsControllerProvider).level;

    final Iterable<PlayerTitle> eligibleTitles = TitlesRepository.playerTitles
        .where((PlayerTitle t) => t.level != null && t.level! <= playerLevel);

    if (eligibleTitles.isEmpty) {
      return null;
    }

    return eligibleTitles.reduce(
      (PlayerTitle a, PlayerTitle b) => a.level! > b.level! ? a : b,
    );
  }

  String _getRandomGreeting() {
    final Random random = Random();
    return _greetings[random.nextInt(_greetings.length)];
  }

  String _getGreeting() {
    final String title = _getCurrentTitle()?.title ?? "None";
    return "$_greeting $title!";
  }
}
