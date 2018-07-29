import 'package:test/test.dart';
import 'package:leap/leap.dart';

void main() {
  final Leap leap = new Leap();

  group('Leap', () {
    test("year not divisible by 4: common year", () {
      final bool result = leap.leapYear(2015);
      expect(result, equals(false));
    }, skip: false);

    test("is introduced every 4 years to adjust about a day", () {
      final bool result = leap.leapYear(1996);
      expect(result, equals(true));
    }, skip: true);

    test("is skipped every 100 years to remove an extra day", () {
      final bool result = leap.leapYear(2100);
      expect(result, equals(false));
    }, skip: true);

    test("is reintroduced every 400 years to adjust another day", () {
      final bool result = leap.leapYear(2000);
      expect(result, equals(true));
    }, skip: true);

    test("is introduced every 4 years to adjust about a day before 400 A.D.", () {
      final bool result = leap.leapYear(4);
      expect(result, equals(true));
    }, skip: true);

    test("is skipped every 100 years to remove an extra day before 400 A.D.", () {
      final bool result = leap.leapYear(300);
      expect(result, equals(false));
    }, skip: true);

    test("is reintroduced every 400 years to adjust another day including 400 A.D.", () {
      final bool result = leap.leapYear(400);
      expect(result, equals(true));
    }, skip: true);
  });
}
