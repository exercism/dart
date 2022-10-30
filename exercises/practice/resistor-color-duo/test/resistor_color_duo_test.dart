import 'package:resistor_color_duo/resistor_color_duo.dart';
import 'package:test/test.dart';

void main() {
  final resistorColorDuo = ResistorColorDuo();

  group('ResistorColorDuo', () {
    test('Brown and black', () {
      final result = resistorColorDuo.value(<String>['brown', 'black']);
      expect(result, equals(10));
    }, skip: false);

    test('Blue and grey', () {
      final result = resistorColorDuo.value(<String>['blue', 'grey']);
      expect(result, equals(68));
    }, skip: true);

    test('Yellow and violet', () {
      final result = resistorColorDuo.value(<String>['yellow', 'violet']);
      expect(result, equals(47));
    }, skip: true);

    test('White and red', () {
      final result = resistorColorDuo.value(<String>['white', 'red']);
      expect(result, equals(92));
    }, skip: true);

    test('Orange and orange', () {
      final result = resistorColorDuo.value(<String>['orange', 'orange']);
      expect(result, equals(33));
    }, skip: true);

    test('Ignore additional colors', () {
      final result = resistorColorDuo.value(<String>['green', 'brown', 'orange']);
      expect(result, equals(51));
    }, skip: true);

    test('Black and brown, one-digit', () {
      final result = resistorColorDuo.value(<String>['black', 'brown']);
      expect(result, equals(1));
    }, skip: true);
  });
}
