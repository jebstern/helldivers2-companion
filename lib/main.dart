import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

import "core/infrastructure/firebase_options.dart";
import "core/providers.dart";
import "core/utils/hd_logger.dart";
import "helldivers_app.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
  );

  initLogging();

  return runApp(
    UncontrolledProviderScope(
      container: container,
      child: const HelldiversApp(),
    ),
  );
}
