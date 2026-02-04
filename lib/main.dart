import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:shared_preferences/shared_preferences.dart";

import "core/constants/titles_repository.dart";
import "core/domain/i_shared_preferences_repository.dart";
import "core/infrastructure/firebase_options.dart";
import "core/infrastructure/settings.dart";
import "core/infrastructure/shared_preferences_repository.dart";
import "core/utils/hd_logger.dart";
import "helldivers_app.dart";
import "news/application/news_controller.dart";
import "settings/application/settings_controller.dart";
import "warbonds/application/warbonds_controller.dart";

late final Settings settings;
final GetIt di = GetIt.I;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  settings = Settings(sharedPreferences);

  initLogging();

  setupDi(sharedPreferences: sharedPreferences);

  return runApp(const HelldiversApp());
}

void setupDi({required SharedPreferences sharedPreferences}) {
  di
    ..registerLazySingleton(NewsController.new)
    ..registerLazySingleton(SettingsController.new)
    ..registerLazySingleton(WarbondsController.new)
    ..registerLazySingleton(TitlesRepository.new)
    ..registerLazySingleton<ISharedPreferencesRepository>(() {
      return SharedPreferencesRepository(sharedPreferences: sharedPreferences);
    });
}
