import 'package:resistor_color/resistor_color.dart';
import 'package:test/test.dart';

final resistorColor = ResistorColor();

void main() {
  group('ResistorColor: resistor color tests - ', resistorColorTests);
  group('ResistorColor: Color codes - ', colorCodes);
}

void resistorColorTests() {
  test('Colors', () {
    final result = resistorColor.colors;
    expect(result,
        equals(<String>['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']));
  }, skip: false);
}

void colorCodes() {
  test('Black', () {
    final result = resistorColor.colorCode('black');
    expect(result, equals(0));
  }, skip: true);

  test('White', () {
    final result = resistorColor.colorCode('white');
    expect(result, equals(9));
  }, skip: true);

  test('Orange', () {
    final result = resistorColor.colorCode('orange');
    expect(result, equals(3));
  }, skip: true);
}
