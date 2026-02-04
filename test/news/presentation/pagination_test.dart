import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/news/presentation/pagination.dart";

void main() {
  group("ResponsivePagination", () {
    testWidgets("renders current page and neighbors", (
      WidgetTester tester,
    ) async {
      int? selectedPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsivePagination(
              totalPages: 10,
              currentPage: 5,
              onPageChanged: (int page) => selectedPage = page,
            ),
          ),
        ),
      );

      // Should find current page
      expect(find.text("5"), findsOneWidget);

      // Should find last page
      expect(find.text("10"), findsOneWidget);

      // Should find first page
      expect(find.text("1"), findsOneWidget);

      // Tap on a page
      await tester.tap(find.text("6"));
      expect(selectedPage, 6);
    });

    testWidgets("navigates with arrows", (WidgetTester tester) async {
      int? selectedPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsivePagination(
              totalPages: 10,
              currentPage: 5,
              onPageChanged: (int page) => selectedPage = page,
            ),
          ),
        ),
      );

      // Tap next
      await tester.tap(find.byIcon(Icons.chevron_right));
      expect(selectedPage, 6);

      // Tap previous
      await tester.tap(find.byIcon(Icons.chevron_left));
      expect(selectedPage, 4);
    });

    testWidgets("handles edge cases for arrows", (WidgetTester tester) async {
      int? selectedPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsivePagination(
              totalPages: 10,
              currentPage: 1,
              onPageChanged: (int page) => selectedPage = page,
            ),
          ),
        ),
      );

      // Previous should be disabled
      final Finder prevArrow = find.byIcon(Icons.chevron_left);
      await tester.tap(prevArrow);
      expect(selectedPage, isNull);

      // Reset and go to last page
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsivePagination(
              totalPages: 10,
              currentPage: 10,
              onPageChanged: (int page) => selectedPage = page,
            ),
          ),
        ),
      );

      // Next should be disabled
      final Finder nextArrow = find.byIcon(Icons.chevron_right);
      await tester.tap(nextArrow);
      expect(selectedPage, isNull);
    });
  });
}
