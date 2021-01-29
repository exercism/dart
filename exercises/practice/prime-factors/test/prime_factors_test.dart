import 'package:prime_factors/prime_factors.dart';
import 'package:test/test.dart';

void main() {
  final primeFactors = new PrimeFactors();

  group('PrimeFactors', () {
    group('returns prime factors for the given input number', () {
      test("no factors", () {
        final List<int> result = primeFactors.factors(1);
        expect(result, equals(<int>[]));
      }, skip: false);

      test("prime number", () {
        final List<int> result = primeFactors.factors(2);
        expect(result, equals([2]));
      }, skip: true);

      test("square of a prime", () {
        final List<int> result = primeFactors.factors(9);
        expect(result, equals([3, 3]));
      }, skip: true);

      test("cube of a prime", () {
        final List<int> result = primeFactors.factors(8);
        expect(result, equals([2, 2, 2]));
      }, skip: true);

      test("product of primes and non-primes", () {
        final List<int> result = primeFactors.factors(12);
        expect(result, equals([2, 2, 3]));
      }, skip: true);

      test("product of primes", () {
        final List<int> result = primeFactors.factors(901255);
        expect(result, equals([5, 17, 23, 461]));
      }, skip: true);

      test("factors include a large prime", () {
        final List<int> result = primeFactors.factors(93819012551);
        expect(result, equals([11, 9539, 894119]));
      }, skip: true);
    });
  });
}
