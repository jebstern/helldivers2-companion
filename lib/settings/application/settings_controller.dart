import "dart:async";

import "package:signals_flutter/signals_flutter.dart";

import "../../core/constants/player_constants.dart";
import "../../core/domain/i_shared_preferences_repository.dart";
import "../../core/infrastructure/shared_preferences_repository.dart";
import "../../core/utils/debounce.dart";
import "../../main.dart";
import "settings_state.dart";

/// A controller that manages application-wide settings and their persistence.
///
/// It uses [ISharedPreferencesRepository] for data storage and [FlutterSignal]
/// to notify listeners of state changes.
class SettingsController {
  /// Creates a [SettingsController] and initializes its state from storage.
  SettingsController({ISharedPreferencesRepository? sharedPreferencesRepository})
    : _sharedPreferencesRepository =
          sharedPreferencesRepository ?? di<ISharedPreferencesRepository>() {
    build();
  }

  final ISharedPreferencesRepository _sharedPreferencesRepository;
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));

  /// The current state of settings, exposed as a signal.
  final FlutterSignal<SettingsState> state = signal<SettingsState>(
    const SettingsState(),
  );

  /// Initializes or re-synchronizes the controller's state with stored data.
  void build() {
    int level =
        _sharedPreferencesRepository.readInt(SharedPreferencesKey.level) ??
        PlayerConstants.minLevel;

    // Sentinel task: Validate data from external storage
    if (level < PlayerConstants.minLevel || level > PlayerConstants.maxLevel) {
      level = level.clamp(PlayerConstants.minLevel, PlayerConstants.maxLevel);
    }

    state.value = SettingsState(level: level);
  }

  /// Updates the player level and persists the change with a debounce.
  ///
  /// The [level] is clamped between [PlayerConstants.minLevel] and
  /// [PlayerConstants.maxLevel].
  void setLevel(int level) {
    final int clampedLevel = level.clamp(
      PlayerConstants.minLevel,
      PlayerConstants.maxLevel,
    );
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
