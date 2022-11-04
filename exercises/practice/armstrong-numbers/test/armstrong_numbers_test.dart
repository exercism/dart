import 'package:armstrong_numbers/armstrong_numbers.dart';
import 'package:test/test.dart';

void main() {
  final armstrongNumbers = ArmstrongNumbers();

  group('ArmstrongNumbers', () {
    test('Zero is an Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('0');
      expect(result, equals(true));
    }, skip: false);

    test('Single-digit numbers are Armstrong numbers', () {
      final result = armstrongNumbers.isArmstrongNumber('5');
      expect(result, equals(true));
    }, skip: true);

    test('There are no two-digit Armstrong numbers', () {
      final result = armstrongNumbers.isArmstrongNumber('10');
      expect(result, equals(false));
    }, skip: true);

    test('Three-digit number that is an Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('153');
      expect(result, equals(true));
    }, skip: true);

    test('Three-digit number that is not an Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('100');
      expect(result, equals(false));
    }, skip: true);

    test('Four-digit number that is an Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('9474');
      expect(result, equals(true));
    }, skip: true);

    test('Four-digit number that is not an Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('9475');
      expect(result, equals(false));
    }, skip: true);

    test('Seven-digit number that is an Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('9926315');
      expect(result, equals(true));
    }, skip: true);

    test('Seven-digit number that is not an Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('9926314');
      expect(result, equals(false));
    }, skip: true);

    test('Armstrong number containing seven zeroes', () {
      final result = armstrongNumbers.isArmstrongNumber('186709961001538790100634132976990');
      expect(result, equals(true));
    }, skip: true);

    test('The largest and last Armstrong number', () {
      final result = armstrongNumbers.isArmstrongNumber('115132219018763992565095597973971522401');
      expect(result, equals(true));
    }, skip: true);
  });
}
