import 'package:darts/darts.dart';
import 'package:test/test.dart';

void main() {
  final darts = new Darts();

  group('Darts', () {
    group('Return the correct amount earned by a dart landing in a given point in the target problem.', () {
      test("A dart lands outside the target", () {
        final int result = darts.score(-9, 9);
        expect(result, equals(0));
      }, skip: false);

      test("A dart lands just in the border of the target", () {
        final int result = darts.score(0, 10);
        expect(result, equals(1));
      }, skip: true);

      test("A dart lands in the outer circle", () {
        final int result = darts.score(4, 4);
        expect(result, equals(1));
      }, skip: true);

      test("A dart lands right in the border between outer and middle circles", () {
        final int result = darts.score(5, 0);
        expect(result, equals(5));
      }, skip: true);

      test("A dart lands in the middle circle", () {
        final int result = darts.score(0.8, -0.8);
        expect(result, equals(5));
      }, skip: true);

      test("A dart lands right in the border between middle and inner circles", () {
        final int result = darts.score(0, -1);
        expect(result, equals(10));
      }, skip: true);

      test("A dart lands in the inner circle", () {
        final int result = darts.score(-0.1, -0.1);
        expect(result, equals(10));
      }, skip: true);

      test("A dart whose coordinates sum to > 1 but whose radius to origin is <= 1 is scored in the inner circle", () {
        final int result = darts.score(0.4, 0.8);
        expect(result, equals(10));
      }, skip: true);

      test("A dart whose coordinates sum to > 5 but whose radius to origin is <= 5 is scored in the middle circle", () {
        final int result = darts.score(2, 4);
        expect(result, equals(5));
      }, skip: true);

      test("A dart whose coordinates sum to > 10 but whose radius to origin is <= 10 is scored in the outer circle",
          () {
        final int result = darts.score(4, 8);
        expect(result, equals(1));
      }, skip: true);
    });
  });
}
