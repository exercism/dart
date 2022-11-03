import 'package:luhn/luhn.dart';
import 'package:test/test.dart';

void main() {
  final luhn = Luhn();

  group('Luhn', () {
    test('single digit strings can not be valid', () {
      final result = luhn.valid('1');
      expect(result, equals(false));
    }, skip: false);

    test('a single zero is invalid', () {
      final result = luhn.valid('0');
      expect(result, equals(false));
    }, skip: true);

    test('a simple valid SIN that remains valid if reversed', () {
      final result = luhn.valid('059');
      expect(result, equals(true));
    }, skip: true);

    test('a simple valid SIN that becomes invalid if reversed', () {
      final result = luhn.valid('59');
      expect(result, equals(true));
    }, skip: true);

    test('a valid Canadian SIN', () {
      final result = luhn.valid('055 444 285');
      expect(result, equals(true));
    }, skip: true);

    test('invalid Canadian SIN', () {
      final result = luhn.valid('055 444 286');
      expect(result, equals(false));
    }, skip: true);

    test('invalid credit card', () {
      final result = luhn.valid('8273 1232 7352 0569');
      expect(result, equals(false));
    }, skip: true);

    test('invalid long number with an even remainder', () {
      final result = luhn.valid('1 2345 6789 1234 5678 9012');
      expect(result, equals(false));
    }, skip: true);

    test('invalid long number with a remainder divisible by 5', () {
      final result = luhn.valid('1 2345 6789 1234 5678 9013');
      expect(result, equals(false));
    }, skip: true);

    test('valid number with an even number of digits', () {
      final result = luhn.valid('095 245 88');
      expect(result, equals(true));
    }, skip: true);

    test('valid number with an odd number of spaces', () {
      final result = luhn.valid('234 567 891 234');
      expect(result, equals(true));
    }, skip: true);

    test('valid strings with a non-digit added at the end become invalid', () {
      final result = luhn.valid('059a');
      expect(result, equals(false));
    }, skip: true);

    test('valid strings with punctuation included become invalid', () {
      final result = luhn.valid('055-444-285');
      expect(result, equals(false));
    }, skip: true);

    test('valid strings with symbols included become invalid', () {
      final result = luhn.valid('055# 444\$ 285');
      expect(result, equals(false));
    }, skip: true);

    test('single zero with space is invalid', () {
      final result = luhn.valid(' 0');
      expect(result, equals(false));
    }, skip: true);

    test('more than a single zero is valid', () {
      final result = luhn.valid('0000 0');
      expect(result, equals(true));
    }, skip: true);

    test('input digit 9 is correctly converted to output digit 9', () {
      final result = luhn.valid('091');
      expect(result, equals(true));
    }, skip: true);

    test('very long input is valid', () {
      final result = luhn.valid('9999999999 9999999999 9999999999 9999999999');
      expect(result, equals(true));
    }, skip: true);

    test('valid luhn with an odd number of digits and non zero first digit', () {
      final result = luhn.valid('109');
      expect(result, equals(true));
    }, skip: true);

    test('using ascii value for non-doubled non-digit isn\'t allowed', () {
      final result = luhn.valid('055b 444 285');
      expect(result, equals(false));
    }, skip: true);

    test('using ascii value for doubled non-digit isn\'t allowed', () {
      final result = luhn.valid(':9');
      expect(result, equals(false));
    }, skip: true);

    test('non-numeric, non-space char in the middle with a sum that\'s divisible by 10 isn\'t allowed', () {
      final result = luhn.valid('59%59');
      expect(result, equals(false));
    }, skip: true);
  });
}
