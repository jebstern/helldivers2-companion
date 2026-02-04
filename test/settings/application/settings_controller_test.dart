import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/core/constants/player_constants.dart";
import "package:helldivers2_companion/core/domain/i_shared_preferences_repository.dart";
import "package:helldivers2_companion/core/infrastructure/shared_preferences_repository.dart";
import "package:helldivers2_companion/main.dart";
import "package:helldivers2_companion/settings/application/settings_controller.dart";
import "package:mocktail/mocktail.dart";

class MockSharedPreferencesRepository extends Mock
    implements ISharedPreferencesRepository {}

void main() {
  late MockSharedPreferencesRepository mockRepo;

  setUpAll(() {
    registerFallbackValue(SharedPreferencesKey.level);
  });

  setUp(() {
    di.allowReassignment = true;
    mockRepo = MockSharedPreferencesRepository();
    di.registerSingleton<ISharedPreferencesRepository>(mockRepo);
  });

  group("SettingsController", () {
    test("initializes with default level if none stored", () {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(null);

      final SettingsController controller = SettingsController();

      expect(controller.state.value.level, PlayerConstants.minLevel);
    });

    test("initializes with stored level", () {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(50);

      final SettingsController controller = SettingsController();

      expect(controller.state.value.level, 50);
    });

    test("clams stored level if out of bounds", () {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(200);

      final SettingsController controller = SettingsController();

      expect(controller.state.value.level, PlayerConstants.maxLevel);
    });

    test("setLevel updates state and persists with debounce", () async {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(10);
      when(() => mockRepo.writeInt(any(), any())).thenAnswer((_) async {});

      final SettingsController controller = SettingsController();
      controller.setLevel(20);

      expect(controller.state.value.level, 20);

      // Wait for debounce (500ms)
      await Future<void>.delayed(const Duration(milliseconds: 600));

      verify(
        () => mockRepo.writeInt(SharedPreferencesKey.level, 20),
      ).called(1);
    });

    test("setLevel clamps level", () {
      when(() => mockRepo.readInt(SharedPreferencesKey.level)).thenReturn(10);
      final SettingsController controller = SettingsController();

      controller.setLevel(200);
      expect(controller.state.value.level, PlayerConstants.maxLevel);

      controller.setLevel(0);
      expect(controller.state.value.level, PlayerConstants.minLevel);
    });
  });
}
