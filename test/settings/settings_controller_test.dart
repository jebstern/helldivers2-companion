// ignore_for_file: discarded_futures, cascade_invocations
import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/core/domain/i_shared_preferences_repository.dart";
import "package:helldivers2_companion/core/infrastructure/shared_preferences_repository.dart";
import "package:helldivers2_companion/main.dart";
import "package:helldivers2_companion/settings/application/settings_controller.dart";
import "package:mocktail/mocktail.dart";

class MockSharedPreferencesRepository extends Mock
    implements ISharedPreferencesRepository {}

void main() {
  late MockSharedPreferencesRepository mockRepo;

  setUp(() {
    di.allowReassignment = true;
    mockRepo = MockSharedPreferencesRepository();
    di.registerSingleton<ISharedPreferencesRepository>(mockRepo);
    registerFallbackValue(SharedPreferencesKey.level);
  });

  group("SettingsController", () {
    test("initial state should be level 1 if no level is stored", () {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(null);

      final SettingsController controller = SettingsController();
      expect(controller.state.value.level, 1);
    });

    test("initial state should be stored level", () {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(50);

      final SettingsController controller = SettingsController();
      expect(controller.state.value.level, 50);
    });

    test("setLevel should update state and call repo after debounce", () async {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(1);
      when(() => mockRepo.writeInt(any(), any())).thenAnswer((_) async {});

      final SettingsController controller = SettingsController()..setLevel(10);

      expect(controller.state.value.level, 10);

      // Wait for debounce (500ms)
      await Future<void>.delayed(const Duration(milliseconds: 600));

      verify(() => mockRepo.writeInt(SharedPreferencesKey.level, 10)).called(1);
    });

    test("setLevel should clamp value between 1 and 150", () async {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(1);
      when(() => mockRepo.writeInt(any(), any())).thenAnswer((_) async {});

      final SettingsController controller = SettingsController();

      // Test upper bound
      controller.setLevel(200);
      expect(controller.state.value.level, 150);

      // Test lower bound
      controller.setLevel(0);
      expect(controller.state.value.level, 1);

      // Wait for debounce
      await Future<void>.delayed(const Duration(milliseconds: 600));

      verify(() => mockRepo.writeInt(SharedPreferencesKey.level, 1)).called(1);
    });
  });
}
