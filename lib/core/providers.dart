// coverage:ignore-file
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:shared_preferences/shared_preferences.dart";

import "domain/i_shared_preferences_repository.dart";
import "infrastructure/shared_preferences_repository.dart";

part "providers.g.dart";

@Riverpod(keepAlive: true)
ISharedPreferencesRepository sharedPreferencesRepository(Ref ref) =>
    SharedPreferencesRepository(
      sharedPreferences: ref.watch(sharedPreferencesProvider),
    );

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) => throw UnimplementedError();
