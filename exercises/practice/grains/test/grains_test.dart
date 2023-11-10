import 'package:grains/grains.dart';
import 'package:test/test.dart';

void main() {
  group('Grains: square -', squareTests);
  group('Grains: total - ', totalTests);
}

void squareTests() {
  test('grains on square 1', () {
    final result = square(1);
    final expected = BigInt.from(1);
    expect(result, equals(expected));
  }, skip: false);

  test('grains on square 2', () {
    final result = square(2);
    final expected = BigInt.from(2);
    expect(result, equals(expected));
  }, skip: true);

  test('grains on square 3', () {
    final result = square(3);
    final expected = BigInt.from(4);
    expect(result, equals(expected));
  }, skip: true);

  test('grains on square 4', () {
    final result = square(4);
    final expected = BigInt.from(8);
    expect(result, equals(expected));
  }, skip: true);

  test('grains on square 16', () {
    final result = square(16);
    final expected = BigInt.from(32768);
    expect(result, equals(expected));
  }, skip: true);

  test('grains on square 32', () {
    final result = square(32);
    final expected = BigInt.from(2147483648);
    expect(result, equals(expected));
  }, skip: true);

  test('grains on square 64', () {
    final result = square(64);
    final expected = BigInt.parse('9223372036854775808');
    expect(result, equals(expected));
  }, skip: true);

  test('square 0 raises an exception', () {
    expect(
        () => square(0),
        throwsA(
          isA<ArgumentError>().having((error) => error.message, 'message', 'square must be between 1 and 64'),
        ));
  }, skip: true);

  test('negative square raises an exception', () {
    expect(
        () => square(-1),
        throwsA(
          isA<ArgumentError>().having((error) => error.message, 'message', 'square must be between 1 and 64'),
        ));
  }, skip: true);

  test('square greater than 64 raises an exception', () {
    expect(
        () => square(65),
        throwsA(
          isA<ArgumentError>().having((error) => error.message, 'message', 'square must be between 1 and 64'),
        ));
  }, skip: true);
}

void totalTests() {
  test('returns the total number of grains on the board', () {
    final result = total();
    final expected = BigInt.parse('18446744073709551615');
    expect(result, equals(expected));
  }, skip: true);
}
