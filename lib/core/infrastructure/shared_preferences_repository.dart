// coverage:ignore-file
// ignore_for_file: lines_longer_than_80_chars

import "package:shared_preferences/shared_preferences.dart";

import "../domain/i_shared_preferences_repository.dart";
import "../utils/hd_logger.dart";

enum SharedPreferencesKey {
  level("level");

  const SharedPreferencesKey(this.name);

  final String name;
}

class SharedPreferencesRepository implements ISharedPreferencesRepository {
  SharedPreferencesRepository({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> writeString(SharedPreferencesKey key, String value) async {
    hdLogger.fine(
      '$SharedPreferencesRepository -> writing value "$value" for key "${key.name}".',
    );
    await _sharedPreferences.setString(key.name, value);
  }

  @override
  Future<void> write(String key, String value) async {
    hdLogger.fine(
      '$SharedPreferencesRepository -> writing value "$value" for key "$key".',
    );
    await _sharedPreferences.setString(key, value);
  }

  @override
  String? readString(SharedPreferencesKey key) {
    hdLogger.fine('$SharedPreferencesRepository -> reading key "${key.name}".');
    return _sharedPreferences.getString(key.name);
  }

  @override
  String? read(String key) {
    hdLogger.fine('$SharedPreferencesRepository -> reading key "$key".');
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> writeBool(
    SharedPreferencesKey key, {
    required bool value,
  }) async {
    hdLogger.fine(
      '$SharedPreferencesRepository -> writing value "$value" for key "${key.name}".',
    );
    await _sharedPreferences.setBool(key.name, value);
  }

  @override
  bool? readBool(SharedPreferencesKey key) {
    hdLogger.fine('$SharedPreferencesRepository -> reading key "${key.name}".');
    return _sharedPreferences.getBool(key.name);
  }

  @override
  Future<void> delete(SharedPreferencesKey key) async {
    hdLogger.fine(
      '$SharedPreferencesRepository -> deleting key "${key.name}".',
    );
    await _sharedPreferences.remove(key.name);
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

  @override
  int? readInt(SharedPreferencesKey key) {
    hdLogger.fine('$SharedPreferencesRepository -> reading key "${key.name}".');
    return _sharedPreferences.getInt(key.name);
  }

  @override
  Future<void> writeInt(SharedPreferencesKey key, int value) async {
    hdLogger.fine(
      '$SharedPreferencesRepository -> writing value "$value" for key "${key.name}".',
    );
    await _sharedPreferences.setInt(key.name, value);
  }

  @override
  Future<void> writeList(SharedPreferencesKey key, List<String> value) async {
    hdLogger.fine(
      '$SharedPreferencesRepository -> writing list "$value" for key "${key.name}".',
    );
    await _sharedPreferences.setStringList(key.name, value);
  }

  @override
  List<String>? readList(SharedPreferencesKey key) {
    hdLogger.fine(
      '$SharedPreferencesRepository -> getting list for key "${key.name}".',
    );
    return _sharedPreferences.getStringList(key.name);
  }
}
