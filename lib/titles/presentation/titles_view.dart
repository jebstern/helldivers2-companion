// ignore_for_file: lines_longer_than_80_chars

import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../../core/presentation/base_view.dart";
import "../../main.dart" show di;
import "../application/titles_controller.dart";
import "../application/titles_state.dart";
import "../domain/player_title.dart";

/// A view that displays a list of player titles and their sources.
class TitlesView extends StatelessWidget {
  /// Creates a [TitlesView].
  const TitlesView({super.key});

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;
    final TitlesController controller = di<TitlesController>();

    return BaseView(
      child: Watch((BuildContext context) {
        final TitlesState titlesState = controller.state.watch(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...titlesState.titles.map((PlayerTitle title) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${title.title}: ",
                    style:
                        typography.base.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(title.source, style: typography.base),
                  const SizedBox(height: 16),
                ],
              );
            }),
          ],
        );
      }),
    );
  }
}
