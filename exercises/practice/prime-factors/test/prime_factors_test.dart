import 'package:prime_factors/prime_factors.dart';
import 'package:test/test.dart';

void main() {
  final primeFactors = PrimeFactors();

  group('PrimeFactors', () {
    test('no factors', () {
      final result = primeFactors.factors(1);
      expect(result, equals([]));
    }, skip: false);

    test('prime number', () {
      final result = primeFactors.factors(2);
      expect(result, equals([2]));
    }, skip: true);

    test('another prime number', () {
      final result = primeFactors.factors(3);
      expect(result, equals([3]));
    }, skip: true);

    test('square of a prime', () {
      final result = primeFactors.factors(9);
      expect(result, equals([3, 3]));
    }, skip: true);

    test('product of first prime', () {
      final result = primeFactors.factors(4);
      expect(result, equals([2, 2]));
    }, skip: true);

    test('cube of a prime', () {
      final result = primeFactors.factors(8);
      expect(result, equals([2, 2, 2]));
    }, skip: true);

    test('product of second prime', () {
      final result = primeFactors.factors(27);
      expect(result, equals([3, 3, 3]));
    }, skip: true);

    test('product of third prime', () {
      final result = primeFactors.factors(625);
      expect(result, equals([5, 5, 5, 5]));
    }, skip: true);

    test('product of first and second prime', () {
      final result = primeFactors.factors(6);
      expect(result, equals([2, 3]));
    }, skip: true);

    test('product of primes and non-primes', () {
      final result = primeFactors.factors(12);
      expect(result, equals([2, 2, 3]));
    }, skip: true);

    test('product of primes', () {
      final result = primeFactors.factors(901255);
      expect(result, equals([5, 17, 23, 461]));
    }, skip: true);

    test('factors include a large prime', () {
      final result = primeFactors.factors(93819012551);
      expect(result, equals([11, 9539, 894119]));
    }, skip: true);
  });
}
