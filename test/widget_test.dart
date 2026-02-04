import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/helldivers_app.dart";

void main() {
  testWidgets("App should load", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HelldiversApp());

    // Basic check that the app starts.
    expect(find.byType(HelldiversApp), findsOneWidget);
  });
}
