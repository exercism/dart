import 'package:resistor_color/resistor_color.dart';
import 'package:test/test.dart';

void main() {
  final resistorColor = new ResistorColor();

  group('ResistorColor', () {
    group('Color codes', () {
      test("Black", () {
        final int result = resistorColor.colorCode("black");
        expect(result, equals(0));
      }, skip: false);

      test("White", () {
        final int result = resistorColor.colorCode("white");
        expect(result, equals(9));
      }, skip: true);

      test("Orange", () {
        final int result = resistorColor.colorCode("orange");
        expect(result, equals(3));
      }, skip: true);
    });

    test("Colors", () {
      final List<String> result = resistorColor.colors;
      expect(result, equals(["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]));
    }, skip: true);
  });
}
