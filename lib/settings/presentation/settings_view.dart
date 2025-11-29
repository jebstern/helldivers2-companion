import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:forui/forui.dart";

import "../application/settings_controller.dart";
import "../application/settings_state.dart";

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  static const int _maxValue = 150;
  static const int _minValue = 1;

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;
    final SettingsState settingsState = ref.watch(settingsControllerProvider);

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

                ref
                    .read(settingsControllerProvider.notifier)
                    .setLevel(newLevel);
              },
              min: _minValue.toDouble(),
              max: _maxValue.toDouble(),
              label: "${settingsState.level}",
            ),
          ),
        ),
        const FDivider(),
      ],
    );
  }
}
