import "../infrastructure/shared_preferences_repository.dart";

abstract class ISharedPreferencesRepository {
  Future<void> clear();
  Future<void> delete(SharedPreferencesKey key);
  bool? readBool(SharedPreferencesKey key);
  int? readInt(SharedPreferencesKey key);
  List<String>? readList(SharedPreferencesKey key);
  String? readString(SharedPreferencesKey key);
  String? read(String key);
  Future<void> writeBool(SharedPreferencesKey key, {required bool value});
  Future<void> writeInt(SharedPreferencesKey key, int value);
  Future<void> writeList(SharedPreferencesKey key, List<String> value);
  Future<void> writeString(SharedPreferencesKey key, String value);
  Future<void> write(String key, String value);
}
