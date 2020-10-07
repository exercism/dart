import 'package:test/test.dart';
import 'package:triangle/triangle.dart';

final triangle = Triangle();

void main() {
  group('Triangle', () {
    group('equilateral triangle', () {
      test('all sides are equal', () {
        final bool result = triangle.equilateral(2, 2, 2);
        expect(result, equals(true));
      }, skip: false);

      test('any side is unequal', () {
        final bool result = triangle.equilateral(2, 3, 2);
        expect(result, equals(false));
      }, skip: true);

      test('no sides are equal', () {
        final bool result = triangle.equilateral(5, 4, 6);
        expect(result, equals(false));
      }, skip: true);

      test('all zero sides is not a triangle', () {
        final bool result = triangle.equilateral(0, 0, 0);
        expect(result, equals(false));
      }, skip: true);

      test('sides may be floats', () {
        final bool result = triangle.equilateral(0.5, 0.5, 0.5);
        expect(result, equals(true));
      }, skip: true);
    });

    group('isosceles triangle', () {
      test('last two sides are equal', () {
        final bool result = triangle.isosceles(3, 4, 4);
        expect(result, equals(true));
      }, skip: true);

      test('first two sides are equal', () {
        final bool result = triangle.isosceles(4, 4, 3);
        expect(result, equals(true));
      }, skip: true);

      test('first and last sides are equal', () {
        final bool result = triangle.isosceles(4, 3, 4);
        expect(result, equals(true));
      }, skip: true);

      test('equilateral triangles are also isosceles', () {
        final bool result = triangle.isosceles(4, 4, 4);
        expect(result, equals(true));
      }, skip: true);

      test('no sides are equal', () {
        final bool result = triangle.isosceles(2, 3, 4);
        expect(result, equals(false));
      }, skip: true);

      test('first triangle inequality violation', () {
        final bool result = triangle.isosceles(1, 1, 3);
        expect(result, equals(false));
      }, skip: true);

      test('second triangle inequality violation', () {
        final bool result = triangle.isosceles(1, 3, 1);
        expect(result, equals(false));
      }, skip: true);

      test('third triangle inequality violation', () {
        final bool result = triangle.isosceles(3, 1, 1);
        expect(result, equals(false));
      }, skip: true);

      test('sides may be floats', () {
        final bool result = triangle.isosceles(0.5, 0.4, 0.5);
        expect(result, equals(true));
      }, skip: true);
    });

    group('scalene triangle', () {
      test('no sides are equal', () {
        final bool result = triangle.scalene(5, 4, 6);
        expect(result, equals(true));
      }, skip: true);

      test('all sides are equal', () {
        final bool result = triangle.scalene(4, 4, 4);
        expect(result, equals(false));
      }, skip: true);

      test('two sides are equal', () {
        final bool result = triangle.scalene(4, 4, 3);
        expect(result, equals(false));
      }, skip: true);

      test('may not violate triangle inequality', () {
        final bool result = triangle.scalene(7, 3, 2);
        expect(result, equals(false));
      }, skip: true);

      test('sides may be floats', () {
        final bool result = triangle.scalene(0.5, 0.4, 0.6);
        expect(result, equals(true));
      }, skip: true);
    });
  });
}
