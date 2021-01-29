import 'package:nth_prime/nth_prime.dart';
import 'package:test/test.dart';

void main() {
  final nthPrime = new NthPrime();
  final noZerothPrime = predicate((ArgumentError e) => e is ArgumentError && e.message == 'There is no zeroth prime',
      'an ArgumentError with the message "There is no zeroth prime"');

  group('NthPrime', () {
    test('first prime', () {
      final int result = nthPrime.prime(1);
      expect(result, equals(2));
    }, skip: false);

    test('second prime', () {
      final int result = nthPrime.prime(2);
      expect(result, equals(3));
    }, skip: true);

    test('sixth prime', () {
      final int result = nthPrime.prime(6);
      expect(result, equals(13));
    }, skip: true);

    test('big prime', () {
      final int result = nthPrime.prime(10001);
      expect(result, equals(104743));
    }, skip: true);

    test('there is no zeroth prime', () {
      expect(() => nthPrime.prime(0), throwsA(noZerothPrime));
    }, skip: true);
  });
}
