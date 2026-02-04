import "package:firebase_core/firebase_core.dart";
import "package:firebase_core_platform_interface/test.dart";
import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/helldivers_app.dart";
import "package:helldivers2_companion/main.dart";
import "package:shared_preferences/shared_preferences.dart";

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    setupFirebaseCoreMocks();

    await Firebase.initializeApp();

    SharedPreferences.setMockInitialValues(
      <String, Object>{},
    ); //set values here
    final SharedPreferences pref = await SharedPreferences.getInstance();

    setupDi(sharedPreferences: pref);
  });

  testWidgets("App should load", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HelldiversApp());

    // Basic check that the app starts.
    expect(find.byType(HelldiversApp), findsOneWidget);
  });
}
