import 'package:meetup/meetup.dart';
import 'package:test/test.dart';

void main() {
  final meetup = Meetup();

  test("when teenth Monday is the 13th, the first day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "teenth", dayofweek: "Monday");
    expect(result, equals("2013-05-13"));
  }, skip: false);

  test("when teenth Monday is the 19th, the last day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "teenth", dayofweek: "Monday");
    expect(result, equals("2013-08-19"));
  }, skip: true);

  test("when teenth Monday is some day in the middle of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "teenth", dayofweek: "Monday");
    expect(result, equals("2013-09-16"));
  }, skip: true);

  test("when teenth Tuesday is the 19th, the last day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "teenth", dayofweek: "Tuesday");
    expect(result, equals("2013-03-19"));
  }, skip: true);

  test("when teenth Tuesday is some day in the middle of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "teenth", dayofweek: "Tuesday");
    expect(result, equals("2013-04-16"));
  }, skip: true);

  test("when teenth Tuesday is the 13th, the first day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "teenth", dayofweek: "Tuesday");
    expect(result, equals("2013-08-13"));
  }, skip: true);

  test("when teenth Wednesday is some day in the middle of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 1, week: "teenth", dayofweek: "Wednesday");
    expect(result, equals("2013-01-16"));
  }, skip: true);

  test("when teenth Wednesday is the 13th, the first day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 2, week: "teenth", dayofweek: "Wednesday");
    expect(result, equals("2013-02-13"));
  }, skip: true);

  test("when teenth Wednesday is the 19th, the last day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "teenth", dayofweek: "Wednesday");
    expect(result, equals("2013-06-19"));
  }, skip: true);

  test("when teenth Thursday is some day in the middle of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "teenth", dayofweek: "Thursday");
    expect(result, equals("2013-05-16"));
  }, skip: true);

  test("when teenth Thursday is the 13th, the first day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "teenth", dayofweek: "Thursday");
    expect(result, equals("2013-06-13"));
  }, skip: true);

  test("when teenth Thursday is the 19th, the last day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "teenth", dayofweek: "Thursday");
    expect(result, equals("2013-09-19"));
  }, skip: true);

  test("when teenth Friday is the 19th, the last day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "teenth", dayofweek: "Friday");
    expect(result, equals("2013-04-19"));
  }, skip: true);

  test("when teenth Friday is some day in the middle of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "teenth", dayofweek: "Friday");
    expect(result, equals("2013-08-16"));
  }, skip: true);

  test("when teenth Friday is the 13th, the first day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "teenth", dayofweek: "Friday");
    expect(result, equals("2013-09-13"));
  }, skip: true);

  test("when teenth Saturday is some day in the middle of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 2, week: "teenth", dayofweek: "Saturday");
    expect(result, equals("2013-02-16"));
  }, skip: true);

  test("when teenth Saturday is the 13th, the first day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "teenth", dayofweek: "Saturday");
    expect(result, equals("2013-04-13"));
  }, skip: true);

  test("when teenth Saturday is the 19th, the last day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 10, week: "teenth", dayofweek: "Saturday");
    expect(result, equals("2013-10-19"));
  }, skip: true);

  test("when teenth Sunday is the 19th, the last day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "teenth", dayofweek: "Sunday");
    expect(result, equals("2013-05-19"));
  }, skip: true);

  test("when teenth Sunday is some day in the middle of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "teenth", dayofweek: "Sunday");
    expect(result, equals("2013-06-16"));
  }, skip: true);

  test("when teenth Sunday is the 13th, the first day of the teenth week", () {
    final result = meetup.meetup(year: 2013, month: 10, week: "teenth", dayofweek: "Sunday");
    expect(result, equals("2013-10-13"));
  }, skip: true);

  test("when first Monday is some day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "first", dayofweek: "Monday");
    expect(result, equals("2013-03-04"));
  }, skip: true);

  test("when first Monday is the 1st, the first day of the first week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "first", dayofweek: "Monday");
    expect(result, equals("2013-04-01"));
  }, skip: true);

  test("when first Tuesday is the 7th, the last day of the first week", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "first", dayofweek: "Tuesday");
    expect(result, equals("2013-05-07"));
  }, skip: true);

  test("when first Tuesday is some day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "first", dayofweek: "Tuesday");
    expect(result, equals("2013-06-04"));
  }, skip: true);

  test("when first Wednesday is some day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 7, week: "first", dayofweek: "Wednesday");
    expect(result, equals("2013-07-03"));
  }, skip: true);

  test("when first Wednesday is the 7th, the last day of the first week", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "first", dayofweek: "Wednesday");
    expect(result, equals("2013-08-07"));
  }, skip: true);

  test("when first Thursday is some day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "first", dayofweek: "Thursday");
    expect(result, equals("2013-09-05"));
  }, skip: true);

  test("when first Thursday is another day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 10, week: "first", dayofweek: "Thursday");
    expect(result, equals("2013-10-03"));
  }, skip: true);

  test("when first Friday is the 1st, the first day of the first week", () {
    final result = meetup.meetup(year: 2013, month: 11, week: "first", dayofweek: "Friday");
    expect(result, equals("2013-11-01"));
  }, skip: true);

  test("when first Friday is some day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 12, week: "first", dayofweek: "Friday");
    expect(result, equals("2013-12-06"));
  }, skip: true);

  test("when first Saturday is some day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 1, week: "first", dayofweek: "Saturday");
    expect(result, equals("2013-01-05"));
  }, skip: true);

  test("when first Saturday is another day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 2, week: "first", dayofweek: "Saturday");
    expect(result, equals("2013-02-02"));
  }, skip: true);

  test("when first Sunday is some day in the middle of the first week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "first", dayofweek: "Sunday");
    expect(result, equals("2013-03-03"));
  }, skip: true);

  test("when first Sunday is the 7th, the last day of the first week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "first", dayofweek: "Sunday");
    expect(result, equals("2013-04-07"));
  }, skip: true);

  test("when second Monday is some day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "second", dayofweek: "Monday");
    expect(result, equals("2013-03-11"));
  }, skip: true);

  test("when second Monday is the 8th, the first day of the second week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "second", dayofweek: "Monday");
    expect(result, equals("2013-04-08"));
  }, skip: true);

  test("when second Tuesday is the 14th, the last day of the second week", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "second", dayofweek: "Tuesday");
    expect(result, equals("2013-05-14"));
  }, skip: true);

  test("when second Tuesday is some day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "second", dayofweek: "Tuesday");
    expect(result, equals("2013-06-11"));
  }, skip: true);

  test("when second Wednesday is some day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 7, week: "second", dayofweek: "Wednesday");
    expect(result, equals("2013-07-10"));
  }, skip: true);

  test("when second Wednesday is the 14th, the last day of the second week", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "second", dayofweek: "Wednesday");
    expect(result, equals("2013-08-14"));
  }, skip: true);

  test("when second Thursday is some day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "second", dayofweek: "Thursday");
    expect(result, equals("2013-09-12"));
  }, skip: true);

  test("when second Thursday is another day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 10, week: "second", dayofweek: "Thursday");
    expect(result, equals("2013-10-10"));
  }, skip: true);

  test("when second Friday is the 8th, the first day of the second week", () {
    final result = meetup.meetup(year: 2013, month: 11, week: "second", dayofweek: "Friday");
    expect(result, equals("2013-11-08"));
  }, skip: true);

  test("when second Friday is some day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 12, week: "second", dayofweek: "Friday");
    expect(result, equals("2013-12-13"));
  }, skip: true);

  test("when second Saturday is some day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 1, week: "second", dayofweek: "Saturday");
    expect(result, equals("2013-01-12"));
  }, skip: true);

  test("when second Saturday is another day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 2, week: "second", dayofweek: "Saturday");
    expect(result, equals("2013-02-09"));
  }, skip: true);

  test("when second Sunday is some day in the middle of the second week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "second", dayofweek: "Sunday");
    expect(result, equals("2013-03-10"));
  }, skip: true);

  test("when second Sunday is the 14th, the last day of the second week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "second", dayofweek: "Sunday");
    expect(result, equals("2013-04-14"));
  }, skip: true);

  test("when third Monday is some day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "third", dayofweek: "Monday");
    expect(result, equals("2013-03-18"));
  }, skip: true);

  test("when third Monday is the 15th, the first day of the third week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "third", dayofweek: "Monday");
    expect(result, equals("2013-04-15"));
  }, skip: true);

  test("when third Tuesday is the 21st, the last day of the third week", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "third", dayofweek: "Tuesday");
    expect(result, equals("2013-05-21"));
  }, skip: true);

  test("when third Tuesday is some day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "third", dayofweek: "Tuesday");
    expect(result, equals("2013-06-18"));
  }, skip: true);

  test("when third Wednesday is some day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 7, week: "third", dayofweek: "Wednesday");
    expect(result, equals("2013-07-17"));
  }, skip: true);

  test("when third Wednesday is the 21st, the last day of the third week", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "third", dayofweek: "Wednesday");
    expect(result, equals("2013-08-21"));
  }, skip: true);

  test("when third Thursday is some day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "third", dayofweek: "Thursday");
    expect(result, equals("2013-09-19"));
  }, skip: true);

  test("when third Thursday is another day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 10, week: "third", dayofweek: "Thursday");
    expect(result, equals("2013-10-17"));
  }, skip: true);

  test("when third Friday is the 15th, the first day of the third week", () {
    final result = meetup.meetup(year: 2013, month: 11, week: "third", dayofweek: "Friday");
    expect(result, equals("2013-11-15"));
  }, skip: true);

  test("when third Friday is some day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 12, week: "third", dayofweek: "Friday");
    expect(result, equals("2013-12-20"));
  }, skip: true);

  test("when third Saturday is some day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 1, week: "third", dayofweek: "Saturday");
    expect(result, equals("2013-01-19"));
  }, skip: true);

  test("when third Saturday is another day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 2, week: "third", dayofweek: "Saturday");
    expect(result, equals("2013-02-16"));
  }, skip: true);

  test("when third Sunday is some day in the middle of the third week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "third", dayofweek: "Sunday");
    expect(result, equals("2013-03-17"));
  }, skip: true);

  test("when third Sunday is the 21st, the last day of the third week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "third", dayofweek: "Sunday");
    expect(result, equals("2013-04-21"));
  }, skip: true);

  test("when fourth Monday is some day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "fourth", dayofweek: "Monday");
    expect(result, equals("2013-03-25"));
  }, skip: true);

  test("when fourth Monday is the 22nd, the first day of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "fourth", dayofweek: "Monday");
    expect(result, equals("2013-04-22"));
  }, skip: true);

  test("when fourth Tuesday is the 28th, the last day of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "fourth", dayofweek: "Tuesday");
    expect(result, equals("2013-05-28"));
  }, skip: true);

  test("when fourth Tuesday is some day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "fourth", dayofweek: "Tuesday");
    expect(result, equals("2013-06-25"));
  }, skip: true);

  test("when fourth Wednesday is some day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 7, week: "fourth", dayofweek: "Wednesday");
    expect(result, equals("2013-07-24"));
  }, skip: true);

  test("when fourth Wednesday is the 28th, the last day of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "fourth", dayofweek: "Wednesday");
    expect(result, equals("2013-08-28"));
  }, skip: true);

  test("when fourth Thursday is some day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "fourth", dayofweek: "Thursday");
    expect(result, equals("2013-09-26"));
  }, skip: true);

  test("when fourth Thursday is another day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 10, week: "fourth", dayofweek: "Thursday");
    expect(result, equals("2013-10-24"));
  }, skip: true);

  test("when fourth Friday is the 22nd, the first day of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 11, week: "fourth", dayofweek: "Friday");
    expect(result, equals("2013-11-22"));
  }, skip: true);

  test("when fourth Friday is some day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 12, week: "fourth", dayofweek: "Friday");
    expect(result, equals("2013-12-27"));
  }, skip: true);

  test("when fourth Saturday is some day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 1, week: "fourth", dayofweek: "Saturday");
    expect(result, equals("2013-01-26"));
  }, skip: true);

  test("when fourth Saturday is another day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 2, week: "fourth", dayofweek: "Saturday");
    expect(result, equals("2013-02-23"));
  }, skip: true);

  test("when fourth Sunday is some day in the middle of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "fourth", dayofweek: "Sunday");
    expect(result, equals("2013-03-24"));
  }, skip: true);

  test("when fourth Sunday is the 28th, the last day of the fourth week", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "fourth", dayofweek: "Sunday");
    expect(result, equals("2013-04-28"));
  }, skip: true);

  test("last Monday in a month with four Mondays", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "last", dayofweek: "Monday");
    expect(result, equals("2013-03-25"));
  }, skip: true);

  test("last Monday in a month with five Mondays", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "last", dayofweek: "Monday");
    expect(result, equals("2013-04-29"));
  }, skip: true);

  test("last Tuesday in a month with four Tuesdays", () {
    final result = meetup.meetup(year: 2013, month: 5, week: "last", dayofweek: "Tuesday");
    expect(result, equals("2013-05-28"));
  }, skip: true);

  test("last Tuesday in another month with four Tuesdays", () {
    final result = meetup.meetup(year: 2013, month: 6, week: "last", dayofweek: "Tuesday");
    expect(result, equals("2013-06-25"));
  }, skip: true);

  test("last Wednesday in a month with five Wednesdays", () {
    final result = meetup.meetup(year: 2013, month: 7, week: "last", dayofweek: "Wednesday");
    expect(result, equals("2013-07-31"));
  }, skip: true);

  test("last Wednesday in a month with four Wednesdays", () {
    final result = meetup.meetup(year: 2013, month: 8, week: "last", dayofweek: "Wednesday");
    expect(result, equals("2013-08-28"));
  }, skip: true);

  test("last Thursday in a month with four Thursdays", () {
    final result = meetup.meetup(year: 2013, month: 9, week: "last", dayofweek: "Thursday");
    expect(result, equals("2013-09-26"));
  }, skip: true);

  test("last Thursday in a month with five Thursdays", () {
    final result = meetup.meetup(year: 2013, month: 10, week: "last", dayofweek: "Thursday");
    expect(result, equals("2013-10-31"));
  }, skip: true);

  test("last Friday in a month with five Fridays", () {
    final result = meetup.meetup(year: 2013, month: 11, week: "last", dayofweek: "Friday");
    expect(result, equals("2013-11-29"));
  }, skip: true);

  test("last Friday in a month with four Fridays", () {
    final result = meetup.meetup(year: 2013, month: 12, week: "last", dayofweek: "Friday");
    expect(result, equals("2013-12-27"));
  }, skip: true);

  test("last Saturday in a month with four Saturdays", () {
    final result = meetup.meetup(year: 2013, month: 1, week: "last", dayofweek: "Saturday");
    expect(result, equals("2013-01-26"));
  }, skip: true);

  test("last Saturday in another month with four Saturdays", () {
    final result = meetup.meetup(year: 2013, month: 2, week: "last", dayofweek: "Saturday");
    expect(result, equals("2013-02-23"));
  }, skip: true);

  test("last Sunday in a month with five Sundays", () {
    final result = meetup.meetup(year: 2013, month: 3, week: "last", dayofweek: "Sunday");
    expect(result, equals("2013-03-31"));
  }, skip: true);

  test("last Sunday in a month with four Sundays", () {
    final result = meetup.meetup(year: 2013, month: 4, week: "last", dayofweek: "Sunday");
    expect(result, equals("2013-04-28"));
  }, skip: true);

  test("when last Wednesday in February in a leap year is the 29th", () {
    final result = meetup.meetup(year: 2012, month: 2, week: "last", dayofweek: "Wednesday");
    expect(result, equals("2012-02-29"));
  }, skip: true);

  test("last Wednesday in December that is also the last day of the year", () {
    final result = meetup.meetup(year: 2014, month: 12, week: "last", dayofweek: "Wednesday");
    expect(result, equals("2014-12-31"));
  }, skip: true);

  test("when last Sunday in February in a non-leap year is not the 29th", () {
    final result = meetup.meetup(year: 2015, month: 2, week: "last", dayofweek: "Sunday");
    expect(result, equals("2015-02-22"));
  }, skip: true);

  test("when first Friday is the 7th, the last day of the first week", () {
    final result = meetup.meetup(year: 2012, month: 12, week: "first", dayofweek: "Friday");
    expect(result, equals("2012-12-07"));
  }, skip: true);
}
