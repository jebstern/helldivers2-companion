import "package:shared_preferences/shared_preferences.dart";
import "package:signals_flutter/signals_flutter.dart";

class Settings {
  Settings(this.prefs) {
    _cleanup = effect(() {
      for (final MapEntry<(String, String), Signal<String>> entry
          in setting.store.entries) {
        final String value = entry.value.peek();
        if (prefs.getString(entry.key.$1) != value) {
          prefs.setString(entry.key.$1, value).ignore();
        }
      }
    });
  }
  final SharedPreferences prefs;
  EffectCleanup? _cleanup;
  late final SignalContainer<String, (String, String), Signal<String>> setting =
      signalContainer<String, (String, String)>(
        ((String, String) val) => signal(prefs.getString(val.$1) ?? val.$2),
        cache: true,
      );
  Signal<String> get darkMode => setting(("dark-mode", "false"));
  void dispose() {
    _cleanup?.call();
    setting.dispose();
  }
}
