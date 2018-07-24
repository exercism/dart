import 'package:test/test.dart';
import 'package:phone_number/phone_number.dart';

final PhoneNumber phoneNumber = new PhoneNumber();

void main() {
  group("PhoneNumber: Cleanup special characters - ", cleanUpTest);
  group("PhoneNumber: Number length - ", numberLengthTest);
  group("PhoneNumber: Accept only numbers - ", numbersOnlyTest);
  group("PhoneNumber: Area/Exchange Code - ", areaCodeTests);
  group("PhoneNumber: Edge cases - ", exchangeCodeTests);
}

void cleanUpTest() {
  test("cleans the number", () {
    final String result = phoneNumber.clean("(223) 456-7890");
    expect(result, equals("2234567890"));
  }, skip: false);

  test("cleans numbers with multiple spaces", () {
    final String result = phoneNumber.clean("223 456   7890   ");
    expect(result, equals("2234567890"));
  }, skip: true);

  test("cleans numbers with dots", () {
    final String result = phoneNumber.clean("223.456.7890");
    expect(result, equals("2234567890"));
  }, skip: true);
}

void numberLengthTest() {
  test("invalid when 9 digits", () {
    final String result = phoneNumber.clean("123456789");
    expect(result, equals(null));
  }, skip: true);

  test("invalid when 11 digits and does not start with a 1", () {
    final String result = phoneNumber.clean("22234567890");
    expect(result, equals(null));
  }, skip: true);

  test("valid when 11 digits and starting with 1", () {
    final String result = phoneNumber.clean("12234567890");
    expect(result, equals("2234567890"));
  }, skip: true);

  test("valid when 11 digits and starting with 1 even with punctuation", () {
    final String result = phoneNumber.clean("+1 (223) 456-7890");
    expect(result, equals("2234567890"));
  }, skip: true);

  test("invalid when more than 11 digits", () {
    final String result = phoneNumber.clean("321234567890");
    expect(result, equals(null));
  }, skip: true);
}

void numbersOnlyTest() {
  test("invalid with letters", () {
    final String result = phoneNumber.clean("123-abc-7890");
    expect(result, equals(null));
  }, skip: true);

  test("invalid with punctuations", () {
    final String result = phoneNumber.clean("123-@:!-7890");
    expect(result, equals(null));
  }, skip: true);
}

void areaCodeTests() {
  test("invalid if area code starts with 0", () {
    final String result = phoneNumber.clean("(023) 456-7890");
    expect(result, equals(null));
  }, skip: true);

  test("invalid if area code starts with 1", () {
    final String result = phoneNumber.clean("(123) 456-7890");
    expect(result, equals(null));
  }, skip: true);
}

void exchangeCodeTests() {
  test("invalid if exchange code starts with 0", () {
    final String result = phoneNumber.clean("(223) 056-7890");
    expect(result, equals(null));
  }, skip: true);

  test("invalid if exchange code starts with 1", () {
    final String result = phoneNumber.clean("(223) 156-7890");
    expect(result, equals(null));
  }, skip: true);
}
