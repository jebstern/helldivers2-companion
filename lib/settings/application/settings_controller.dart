import "dart:async";

import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../core/infrastructure/shared_preferences_repository.dart";
import "../../core/providers.dart";
import "../../core/utils/debounce.dart";
import "settings_state.dart";

part "settings_controller.g.dart";

@riverpod
class SettingsController extends _$SettingsController {
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));

  @override
  SettingsState build() {
    final int level =
        ref
            .read(sharedPreferencesRepositoryProvider)
            .readInt(SharedPreferencesKey.level) ??
        1;

    return SettingsState(level: level);
  }

  void setLevel(int level) {
    state = state.copyWith(level: level);
    _debounce(() {
      unawaited(
        ref
            .read(sharedPreferencesRepositoryProvider)
            .writeInt(SharedPreferencesKey.level, level),
      );
    });
  }
}
