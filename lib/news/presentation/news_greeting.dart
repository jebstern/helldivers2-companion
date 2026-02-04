// ignore_for_file: lines_longer_than_80_chars

import "dart:math";

import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../../core/constants/titles_repository.dart";
import "../../main.dart" show di;
import "../../settings/application/settings_controller.dart";
import "../../titles/domain/player_title.dart";

/// A widget that displays a random greeting combined with the player's current title.
///
/// The greeting is randomly selected from a list of predefined strings upon
/// initialization, while the title is determined by the player's level
/// retrieved from [SettingsController].
class NewsGreeting extends StatefulWidget {
  /// Creates a [NewsGreeting].
  const NewsGreeting({super.key});

  @override
  State<NewsGreeting> createState() => _NewsGreetingState();
}

/// The state for [NewsGreeting] that handles random greeting selection and title logic.
class _NewsGreetingState extends State<NewsGreeting> {
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
    return Watch((BuildContext context) {
      return AutoSizeText(
        _getGreeting(context),
        maxLines: 1,
        style: typography.xl5,
        textAlign: TextAlign.center,
      );
    });
  }

  PlayerTitle? _getCurrentTitle(BuildContext context) {
    final SettingsController controller = di<SettingsController>();
    final int playerLevel = controller.state.watch(context).level;

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

  String _getGreeting(BuildContext context) {
    final String title = _getCurrentTitle(context)?.title ?? "None";
    return "$_greeting $title!";
  }
}
