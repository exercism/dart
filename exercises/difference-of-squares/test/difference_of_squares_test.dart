import 'package:test/test.dart';
import 'package:difference_of_squares/difference_of_squares.dart';

void main() {
  final DifferenceOfSquares differenceOfSquares = new DifferenceOfSquares();

  group('DifferenceOfSquares', () {
    group('Square the sum of the numbers up to the given number', () {
      test("square of sum 1", () {
        final num result = differenceOfSquares.squareOfSum(1);
        expect(result, equals(1));
      }, skip: false);

      test("square of sum 5", () {
        final num result = differenceOfSquares.squareOfSum(5);
        expect(result, equals(225));
      }, skip: true);

      test("square of sum 100", () {
        final num result = differenceOfSquares.squareOfSum(100);
        expect(result, equals(25502500));
      }, skip: true);
    });

    group('Sum the squares of the numbers up to the given number', () {
      test("sum of squares 1", () {
        final num result = differenceOfSquares.sumOfSquare(1);
        expect(result, equals(1));
      }, skip: true);

      test("sum of squares 5", () {
        final num result = differenceOfSquares.sumOfSquare(5);
        expect(result, equals(55));
      }, skip: true);

      test("sum of squares 100", () {
        final num result = differenceOfSquares.sumOfSquare(100);
        expect(result, equals(338350));
      }, skip: true);
    });

    group('Subtract sum of squares from square of sums', () {
      test("difference of squares 1", () {
        final num result = differenceOfSquares.differenceOfSquares(1);
        expect(result, equals(0));
      }, skip: true);

      test("difference of squares 5", () {
        final num result = differenceOfSquares.differenceOfSquares(5);
        expect(result, equals(170));
      }, skip: true);

      test("difference of squares 100", () {
        final num result = differenceOfSquares.differenceOfSquares(100);
        expect(result, equals(25164150));
      }, skip: true);
    });
  });
}
