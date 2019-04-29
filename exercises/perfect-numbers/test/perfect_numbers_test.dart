import 'package:perfect_numbers/perfect_numbers.dart';
import 'package:test/test.dart';

void main() {
  final perfectNumbers = new PerfectNumbers();
  final onlyNaturalNumbers = predicate(
      (ArgumentError e) => e is ArgumentError && e.message == 'Classification is only possible for natural numbers',
      'an ArgumentError with the message "Classification is only possible for natural numbers"');

  group('PerfectNumbers', () {
    group('Perfect numbers', () {
      test("Smallest perfect number is classified correctly", () {
        final String result = perfectNumbers.classify(6);
        expect(result, equals("perfect"));
      }, skip: false);

      test("Medium perfect number is classified correctly", () {
        final String result = perfectNumbers.classify(28);
        expect(result, equals("perfect"));
      }, skip: true);

      test("Large perfect number is classified correctly", () {
        final String result = perfectNumbers.classify(33550336);
        expect(result, equals("perfect"));
      }, skip: true);
    });

    group('Abundant numbers', () {
      test("Smallest abundant number is classified correctly", () {
        final String result = perfectNumbers.classify(12);
        expect(result, equals("abundant"));
      }, skip: true);

      test("Medium abundant number is classified correctly", () {
        final String result = perfectNumbers.classify(30);
        expect(result, equals("abundant"));
      }, skip: true);

      test("Large abundant number is classified correctly", () {
        final String result = perfectNumbers.classify(33550335);
        expect(result, equals("abundant"));
      }, skip: true);
    });

    group('Deficient numbers', () {
      test("Smallest prime deficient number is classified correctly", () {
        final String result = perfectNumbers.classify(2);
        expect(result, equals("deficient"));
      }, skip: true);

      test("Smallest non-prime deficient number is classified correctly", () {
        final String result = perfectNumbers.classify(4);
        expect(result, equals("deficient"));
      }, skip: true);

      test("Medium deficient number is classified correctly", () {
        final String result = perfectNumbers.classify(32);
        expect(result, equals("deficient"));
      }, skip: true);

      test("Large deficient number is classified correctly", () {
        final String result = perfectNumbers.classify(33550337);
        expect(result, equals("deficient"));
      }, skip: true);

      test("Edge case (no factors other than itself) is classified correctly", () {
        final String result = perfectNumbers.classify(1);
        expect(result, equals("deficient"));
      }, skip: true);
    });

    group('Invalid inputs', () {
      test("Zero is rejected (not a natural number)", () {
        expect(() => perfectNumbers.classify(0), throwsA(onlyNaturalNumbers));
      }, skip: true);

      test("Negative integer is rejected (not a natural number)", () {
        expect(() => perfectNumbers.classify(-1), throwsA(onlyNaturalNumbers));
      }, skip: true);
    });
  });
}
