import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/core/constants/titles_repository.dart";
import "package:helldivers2_companion/main.dart";
import "package:helldivers2_companion/titles/application/titles_controller.dart";
import "package:helldivers2_companion/titles/domain/player_title.dart";
import "package:mocktail/mocktail.dart";

class MockTitlesRepository extends Mock implements TitlesRepository {}

void main() {
  late MockTitlesRepository mockRepo;

  setUp(() {
    di.allowReassignment = true;
    mockRepo = MockTitlesRepository();
    di.registerSingleton<TitlesRepository>(mockRepo);
  });

  group("TitlesController", () {
    test("initializes with titles from repository", () {
      final List<PlayerTitle> titles = <PlayerTitle>[
        const PlayerTitle(title: "Test Title", source: "Test Source"),
      ];

      when(() => mockRepo.playerTitles).thenReturn(titles);

      final TitlesController controller = TitlesController(repository: mockRepo);

      expect(controller.state.value.titles, isNotEmpty);
      expect(controller.state.value.titles.first.title, "Test Title");
    });

    test("filters out malformed titles", () {
      final List<PlayerTitle> titles = <PlayerTitle>[
        const PlayerTitle(title: "", source: "Test Source"),
        const PlayerTitle(title: "Valid Title", source: "Valid Source"),
      ];

      when(() => mockRepo.playerTitles).thenReturn(titles);

      final TitlesController controller = TitlesController(repository: mockRepo);

      expect(controller.state.value.titles.length, 1);
      expect(controller.state.value.titles.first.title, "Valid Title");
    });
  });
}
