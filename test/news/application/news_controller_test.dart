import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/core/domain/i_shared_preferences_repository.dart";
import "package:helldivers2_companion/main.dart";
import "package:helldivers2_companion/news/application/news_controller.dart";
import "package:helldivers2_companion/news/domain/news_article.dart";
import "package:mocktail/mocktail.dart";

class MockFirestore extends Mock implements FirebaseFirestore {}

// ignore_for_file: subtype_of_sealed_class

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockSharedPreferencesRepository extends Mock
    implements ISharedPreferencesRepository {}

class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

void main() {
  late MockFirestore mockFirestore;
  late MockCollectionReference mockCollection;
  late MockSharedPreferencesRepository mockRepo;
  late MockQuerySnapshot mockSnapshot;

  setUp(() {
    di.allowReassignment = true;
    mockFirestore = MockFirestore();
    mockCollection = MockCollectionReference();
    mockRepo = MockSharedPreferencesRepository();
    mockSnapshot = MockQuerySnapshot();

    di.registerSingleton<ISharedPreferencesRepository>(mockRepo);

    when(() => mockFirestore.collection(any())).thenReturn(mockCollection);
    when(() => mockCollection.snapshots()).thenAnswer(
      (_) => Stream<QuerySnapshot<Map<String, dynamic>>>.fromIterable(
        <QuerySnapshot<Map<String, dynamic>>>[mockSnapshot],
      ),
    );
    when(() => mockSnapshot.docs).thenReturn(
      <QueryDocumentSnapshot<Map<String, dynamic>>>[],
    );
  });

  group("NewsController", () {
    test("initializes and listens to news updates", () {
      final NewsController controller = NewsController(
        firestore: mockFirestore,
      );
      expect(controller.state.value.news, isEmpty);
      verify(() => mockFirestore.collection("news")).called(1);
    });

    test("onPageChanged updates current page", () {
      final NewsController controller = NewsController(
        firestore: mockFirestore,
      );
      controller.onPageChanged(2);
      expect(controller.state.value.currentPage, 2);
    });

    test("onPageChanged ignores invalid pages", () {
      final NewsController controller = NewsController(
        firestore: mockFirestore,
      );
      controller.onPageChanged(0);
      expect(controller.state.value.currentPage, 1);
    });

    test("markAsRead updates state and persists", () async {
      final NewsController controller = NewsController(
        firestore: mockFirestore,
      );

      final NewsArticle newsArticle = NewsArticle(
        id: "1",
        title: "Title",
        text: "Text",
        imagePath: "Path",
        date: DateTime.now(),
        read: false,
      );

      controller.state.value = controller.state.value.copyWith(
        news: <NewsArticle>[newsArticle],
      );

      when(() => mockRepo.write(any(), any())).thenAnswer((_) async {});

      controller.markAsRead(newsArticle);

      expect(controller.state.value.news.first.read, isTrue);
      verify(() => mockRepo.write("Title", any())).called(1);
    });
  });
}
