import 'package:perfect_numbers/perfect_numbers.dart';
import 'package:test/test.dart';

void main() {
  final perfectNumbers = PerfectNumbers();

  group('PerfectNumbers', () {
    group('Perfect numbers', () {
      test('Smallest perfect number is classified correctly', () {
        final result = perfectNumbers.classify(6);
        expect(result, equals(Classification.perfect));
      }, skip: false);

      test('Medium perfect number is classified correctly', () {
        final result = perfectNumbers.classify(28);
        expect(result, equals(Classification.perfect));
      }, skip: true);

      test('Large perfect number is classified correctly', () {
        final result = perfectNumbers.classify(33550336);
        expect(result, equals(Classification.perfect));
      }, skip: true);
    });

    group('Abundant numbers', () {
      test('Smallest abundant number is classified correctly', () {
        final result = perfectNumbers.classify(12);
        expect(result, equals(Classification.abundant));
      }, skip: true);

      test('Medium abundant number is classified correctly', () {
        final result = perfectNumbers.classify(30);
        expect(result, equals(Classification.abundant));
      }, skip: true);

      test('Large abundant number is classified correctly', () {
        final result = perfectNumbers.classify(33550335);
        expect(result, equals(Classification.abundant));
      }, skip: true);
    });

    group('Deficient numbers', () {
      test('Smallest prime deficient number is classified correctly', () {
        final result = perfectNumbers.classify(2);
        expect(result, equals(Classification.deficient));
      }, skip: true);

      test('Smallest non-prime deficient number is classified correctly', () {
        final result = perfectNumbers.classify(4);
        expect(result, equals(Classification.deficient));
      }, skip: true);

      test('Medium deficient number is classified correctly', () {
        final result = perfectNumbers.classify(32);
        expect(result, equals(Classification.deficient));
      }, skip: true);

      test('Large deficient number is classified correctly', () {
        final result = perfectNumbers.classify(33550337);
        expect(result, equals(Classification.deficient));
      }, skip: true);

      test('Edge case (no factors other than itself) is classified correctly', () {
        final result = perfectNumbers.classify(1);
        expect(result, equals(Classification.deficient));
      }, skip: true);
    });

    group('Invalid inputs', () {
      test('Zero is rejected (as it is not a positive integer)', () {
        expect(() => perfectNumbers.classify(0), throwsArgumentError);
      }, skip: true);

      test('Negative integer is rejected (as it is not a positive integer)', () {
        expect(() => perfectNumbers.classify(-1), throwsArgumentError);
      }, skip: true);
    });
  });
}
