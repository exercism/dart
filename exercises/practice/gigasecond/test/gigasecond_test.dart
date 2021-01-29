import 'package:gigasecond/gigasecond.dart';
import 'package:test/test.dart';

void main() {
  group("Gigasecond", gigasecondTests);
}

void gigasecondTests() {
  group('Add one gigasecond to the input. ', () {
    test('date only specification of time', () {
      final DateTime birthDate = DateTime.utc(2011, DateTime.april, 25);
      final DateTime result = add(birthDate);
      DateTime expectedDate = DateTime.utc(2043, DateTime.january, 1, 1, 46, 40);

      expect(result, equals(expectedDate));
    }, skip: false);

    test('second test for date only specification of time', () {
      final DateTime birthDate = DateTime.utc(1977, DateTime.june, 13);
      final DateTime result = add(birthDate);
      DateTime expectedDate = DateTime.utc(2009, DateTime.february, 19, 1, 46, 40);

      expect(result, equals(expectedDate));
    }, skip: true);

    test('third test for date only specification of time', () {
      final DateTime birthDate = DateTime.utc(1959, DateTime.july, 19);
      final DateTime result = add(birthDate);
      DateTime expectedDate = DateTime.utc(1991, DateTime.march, 27, 1, 46, 40);

      expect(result, equals(expectedDate));
    }, skip: true);

    test('full time specified', () {
      final DateTime birthDate = DateTime.utc(2015, DateTime.january, 24, 22, 00, 00);
      final DateTime result = add(birthDate);
      DateTime expectedDate = DateTime.utc(2046, DateTime.october, 2, 23, 46, 40);

      expect(result, equals(expectedDate));
    }, skip: true);

    test('full time with day roll-over', () {
      final DateTime birthDate = DateTime.utc(2015, DateTime.january, 24, 23, 59, 59);
      final DateTime result = add(birthDate);
      DateTime expectedDate = DateTime.utc(2046, DateTime.october, 3, 01, 46, 39);

      expect(result, equals(expectedDate));
    }, skip: true);
  });
}
