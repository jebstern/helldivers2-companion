// ignore_for_file: lines_longer_than_80_chars

import "package:flutter/material.dart";
import "package:forui/forui.dart";

import "../../core/constants/titles_repository.dart";
import "../../core/presentation/base_view.dart";
import "../domain/player_title.dart";

class TitlesView extends StatefulWidget {
  const TitlesView({super.key});

  @override
  State<TitlesView> createState() => _TitlesViewState();
}

class _TitlesViewState extends State<TitlesView> {
  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;

    return BaseView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...TitlesRepository.playerTitles.map((PlayerTitle title) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${title.title}: ",
                  style: typography.base.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(title.source, style: typography.base),
                const SizedBox(height: 16),
              ],
            );
          }),
        ],
      ),
    );
  }
}
