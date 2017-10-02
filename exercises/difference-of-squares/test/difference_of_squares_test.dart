import "package:test/test.dart";
import "package:difference_of_squares/difference_of_squares.dart";

void main() {
  final squares = new DifferenceOfSquares();

  group("DifferenceOfSquares", () {
    group("#squareOfSums()", () {
      test("square of sum 1", () {
        expect(squares.squareOfSums(1), equals(1));
      });

      test("square of sum 5", () {
        expect(squares.squareOfSums(5), equals(225));
      }, skip: true);

      test("square of sum 100", () {
        expect(squares.squareOfSums(100), equals(25502500));
      }, skip: true);
    });

    group("#sumOfSquares()", () {
      test("sum of squares 1", () {
        expect(squares.sumOfSquares(1), equals(1));
      }, skip: true);

      test("sum of squares 5", () {
        expect(squares.sumOfSquares(5), equals(55));
      }, skip: true);

      test("sum of squares 100", () {
        expect(squares.sumOfSquares(100), equals(338350));
      }, skip: true);
    });

    group("#difference()", () {
      test("difference of squares 1", () {
        expect(squares.difference(1), equals(0));
      }, skip: true);

      test("difference of squares 5", () {
        expect(squares.difference(5), equals(170));
      }, skip: true);

      test("difference of squares 100", () {
        expect(squares.difference(100), equals(25164150));
      }, skip: true);
    });
  });
}
