import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../../core/constants/player_constants.dart";
import "../../main.dart" show di;
import "../application/settings_controller.dart";
import "../application/settings_state.dart";

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;
    final SettingsController controller = di<SettingsController>();

    return Watch((BuildContext context) {
      final SettingsState settingsState = controller.state.watch(context);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 32),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Level",
                  style: typography.xl,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Text(
                  "Current: ${settingsState.level}",
                  style: typography.base,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Material(
            color: Colors.transparent,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 1,
                thumbColor: Colors.white,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                year2023: false,
                showValueIndicator: ShowValueIndicator.onDrag,
                valueIndicatorColor: Colors.white,
                valueIndicatorTextStyle: typography.sm.copyWith(
                  color: Colors.black,
                ),
              ),
              child: Slider(
                value: settingsState.level.toDouble(),
                onChanged: (double value) {
                  final int newLevel = value.toInt();

                  controller.setLevel(newLevel);
                },
                min: PlayerConstants.minLevel.toDouble(),
                max: PlayerConstants.maxLevel.toDouble(),
                label: "${settingsState.level}",
              ),
            ),
          ),
          const FDivider(),
        ],
      );
    });
  }
}
