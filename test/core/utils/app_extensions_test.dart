import "package:flutter_test/flutter_test.dart";
import "package:helldivers2_companion/core/utils/app_extensions.dart";

void main() {
  group("StringX extensions", () {
    test(
      "capitalize should capitalize the first letter and lowercase the rest",
      () {
        expect("hello".capitalize, "Hello");
        expect("HELLO".capitalize, "Hello");
        expect("hELLO".capitalize, "Hello");
        expect("".capitalize, "");
        const String? nullString = null;
        expect(nullString.capitalize, "");
      },
    );

    test("equalsIgnoreCase should compare strings ignoring case", () {
      expect("hello".equalsIgnoreCase("HELLO"), isTrue);
      expect("hello".equalsIgnoreCase("hello"), isTrue);
      expect("hello".equalsIgnoreCase("world"), isFalse);
      const String? nullString = null;
      expect("hello".equalsIgnoreCase(nullString), isFalse);
      expect(nullString.equalsIgnoreCase("hello"), isFalse);
    });
  });

  group("Intx extensions", () {
    test("toMMss should format seconds to MM:ss", () {
      expect(65.toMMss, "01:05");
      expect(5.toMMss, "00:05");
      expect(0.toMMss, "00:00");
      expect((-1).toMMss, "00:00");
    });
  });
}
