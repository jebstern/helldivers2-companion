import "dart:async";

import "package:signals_flutter/signals_flutter.dart";

import "../../core/domain/i_shared_preferences_repository.dart";
import "../../core/infrastructure/shared_preferences_repository.dart";
import "../../core/utils/debounce.dart";
import "../../main.dart";
import "settings_state.dart";


class SettingsController {
  SettingsController() {
    _sharedPreferencesRepository = di<ISharedPreferencesRepository>();

    build();
  }

  late final ISharedPreferencesRepository _sharedPreferencesRepository;
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));
  final FlutterSignal<SettingsState> state = signal<SettingsState>(
    const SettingsState(),
  );

  void build() {
    final int level =
        _sharedPreferencesRepository.readInt(SharedPreferencesKey.level) ?? 1;

    state.value = SettingsState(level: level);
  }

  void setLevel(int level) {
    final int clampedLevel = level.clamp(1, 150);
    state.value = state.value.copyWith(level: clampedLevel);
    _debounce(() {
      unawaited(
        _sharedPreferencesRepository.writeInt(
          SharedPreferencesKey.level,
          clampedLevel,
        ),
      );
    });
  }
}
