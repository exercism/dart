import 'package:test/test.dart';
import 'package:gigasecond/gigasecond.dart';

void main() {
  group('Add one gigasecond to the input.', gigasecondTests);
}

void gigasecondTests() {
  test("date only specification of time", () {
    final DateTime birthDate = new DateTime.utc(2011, DateTime.APRIL, 25);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2043, DateTime.JANUARY, 1, 1, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: false);

  test("second test for date only specification of time", () {
    final DateTime birthDate = new DateTime.utc(1977, DateTime.JUNE, 13);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2009, DateTime.FEBRUARY, 19, 1, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: true);

  test("third test for date only specification of time", () {
    final DateTime birthDate = new DateTime.utc(1959, DateTime.JULY, 19);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(1991, DateTime.MARCH, 27, 1, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: true);

  test("full time specified", () {
    final DateTime birthDate = new DateTime.utc(2015, DateTime.JANUARY, 24, 22, 00, 00);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2046, DateTime.OCTOBER, 2, 23, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: true);

  test("full time with day roll-over", () {
    final DateTime birthDate = new DateTime.utc(2015, DateTime.JANUARY, 24, 23, 59, 59);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2046, DateTime.OCTOBER, 3, 01, 46, 39);

    expect(result, equals(expectedDate));
  }, skip: true);
}
