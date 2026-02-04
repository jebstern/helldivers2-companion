import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/warbonds/application/warbonds_controller.dart";
import "package:mocktail/mocktail.dart";

class MockFirestore extends Mock implements FirebaseFirestore {}

// ignore_for_file: subtype_of_sealed_class

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

void main() {
  late MockFirestore mockFirestore;
  late MockCollectionReference mockCollection;
  late MockQuerySnapshot mockSnapshot;

  setUp(() {
    mockFirestore = MockFirestore();
    mockCollection = MockCollectionReference();
    mockSnapshot = MockQuerySnapshot();

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

  group("WarbondsController", () {
    test("initializes and listens to warbond updates", () {
      final WarbondsController controller = WarbondsController(
        firestore: mockFirestore,
      );
      expect(controller.state.value.warbonds, isEmpty);
      verify(() => mockFirestore.collection("warbonds")).called(1);
    });
  });
}
