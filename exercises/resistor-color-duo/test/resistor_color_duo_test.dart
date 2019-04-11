import 'package:resistor_color_duo/resistor_color_duo.dart';
import 'package:test/test.dart';

void main() {
  final resistorColorDuo = new ResistorColorDuo();

  group('ResistorColorDuo', () {
    test("Brown and black", () {
      final int result = resistorColorDuo.value(["brown", "black"]);
      expect(result, equals(10));
    }, skip: false);

    test("Blue and grey", () {
      final int result = resistorColorDuo.value(["blue", "grey"]);
      expect(result, equals(68));
    }, skip: true);

    test("Yellow and violet", () {
      final int result = resistorColorDuo.value(["yellow", "violet"]);
      expect(result, equals(47));
    }, skip: true);

    test("Orange and orange", () {
      final int result = resistorColorDuo.value(["orange", "orange"]);
      expect(result, equals(33));
    }, skip: true);
  });
}
