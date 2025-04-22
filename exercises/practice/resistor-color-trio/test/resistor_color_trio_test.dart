import 'package:resistor_color_trio/resistor_color_trio.dart';
import 'package:test/test.dart';

void main() {
  final resistorColorTrio = ResistorColorTrio();

  group('ResistorColorTrio', () {
    test('Orange and orange and black', () {
      final result = resistorColorTrio.label(['orange', 'orange', 'black']);
      expect(result, equals("33 ohms"));
    }, skip: false);

    test('Blue and grey and brown', () {
      final result = resistorColorTrio.label(['blue', 'grey', 'brown']);
      expect(result, equals("680 ohms"));
    }, skip: true);

    test('Red and black and red', () {
      final result = resistorColorTrio.label(['red', 'black', 'red']);
      expect(result, equals("2 kiloohms"));
    }, skip: true);

    test('Green and brown and orange', () {
      final result = resistorColorTrio.label(['green', 'brown', 'orange']);
      expect(result, equals("51 kiloohms"));
    }, skip: true);

    test('Yellow and violet and yellow', () {
      final result = resistorColorTrio.label(['yellow', 'violet', 'yellow']);
      expect(result, equals("470 kiloohms"));
    }, skip: true);

    test('Blue and violet and blue', () {
      final result = resistorColorTrio.label(['blue', 'violet', 'blue']);
      expect(result, equals("67 megaohms"));
    }, skip: true);

    test('Minimum possible value', () {
      final result = resistorColorTrio.label(['black', 'black', 'black']);
      expect(result, equals("0 ohms"));
    }, skip: true);

    test('Maximum possible value', () {
      final result = resistorColorTrio.label(['white', 'white', 'white']);
      expect(result, equals("99 gigaohms"));
    }, skip: true);

    test('First two colors make an invalid octal number', () {
      final result = resistorColorTrio.label(['black', 'grey', 'black']);
      expect(result, equals("8 ohms"));
    }, skip: true);

    test('Ignore extra colors', () {
      final result = resistorColorTrio.label(['blue', 'green', 'yellow', 'orange']);
      expect(result, equals("650 kiloohms"));
    }, skip: true);
  });
}
