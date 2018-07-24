import 'package:dart2_constant/core.dart' as polyfill;
import 'package:test/test.dart';
import 'package:gigasecond/gigasecond.dart';

void main() {
  group("Gigasecond", gigasecondTests);
}

void gigasecondTests() {
  test("date only specification of time", () {
    final DateTime birthDate = new DateTime.utc(2011, polyfill.DateTime.april, 25);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2043, polyfill.DateTime.january, 1, 1, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: false);

  test("second test for date only specification of time", () {
    final DateTime birthDate = new DateTime.utc(1977, polyfill.DateTime.june, 13);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2009, polyfill.DateTime.february, 19, 1, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: true);

  test("third test for date only specification of time", () {
    final DateTime birthDate = new DateTime.utc(1959, polyfill.DateTime.july, 19);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(1991, polyfill.DateTime.march, 27, 1, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: true);

  test("full time specified", () {
    final DateTime birthDate = new DateTime.utc(2015, polyfill.DateTime.january, 24, 22, 00, 00);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2046, polyfill.DateTime.october, 2, 23, 46, 40);

    expect(result, equals(expectedDate));
  }, skip: true);

  test("full time with day roll-over", () {
    final DateTime birthDate = new DateTime.utc(2015, polyfill.DateTime.january, 24, 23, 59, 59);
    final DateTime result = add(birthDate);
    DateTime expectedDate = new DateTime.utc(2046, polyfill.DateTime.october, 3, 01, 46, 39);

    expect(result, equals(expectedDate));
  }, skip: true);
}
