import 'package:nth_prime/nth_prime.dart';
import 'package:test/test.dart';

void main() {
  final nthPrime = NthPrime();

  group('NthPrime', () {
    test('first prime', () {
      final result = nthPrime.prime(1);
      expect(result, equals(2));
    }, skip: false);

    test('second prime', () {
      final result = nthPrime.prime(2);
      expect(result, equals(3));
    }, skip: true);

    test('sixth prime', () {
      final result = nthPrime.prime(6);
      expect(result, equals(13));
    }, skip: true);

    test('big prime', () {
      final result = nthPrime.prime(10001);
      expect(result, equals(104743));
    }, skip: true);

    test('there is no zeroth prime', () {
      expect(
          () => nthPrime.prime(0),
          throwsA(isA<ArgumentError>()
              .having((e) => e.toString(), 'message', 'Invalid argument(s): There is no zeroth prime')));
    }, skip: true);
  });
}
