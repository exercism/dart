import "package:test/test.dart";
import "package:gigasecond/gigasecond.dart";

DateTime birthDate;
DateTime expectedDate;
Gigasecond gigasecond;

void main() {
  group("Gigasecond", gigasecondTests);
}

void gigasecondTests() {
  setUp(() {
    birthDate = new DateTime.utc(2015, DateTime.SEPTEMBER, 14);
  });

  group("since midnight tests", sinceMidnightTests);
  group("at night tests", atNightTests);
  group("unixEpoch tests", unixEpochTests);
}

void sinceMidnightTests() {
  setUp(() {
    gigasecond = new Gigasecond(birthDate);
    expectedDate = new DateTime.utc(2047, DateTime.MAY, 23, 1, 46, 40);
  });

  test("tells a gigasecond anniversary since midnight", () {
    expect(gigasecond.date(), equals(expectedDate));
  });

  test("make sure calling \"date()\" doesn't mutate value", () {
    gigasecond.date();
    expect(gigasecond.date(), equals(expectedDate));
  });
}

void atNightTests() {
  setUp(() {
    birthDate = birthDate.add(new Duration(hours: 23, minutes: 59, seconds: 59));
    gigasecond = new Gigasecond(birthDate);
    expectedDate = new DateTime.utc(2047, DateTime.MAY, 24, 1, 46, 39);
  });

  test("tells the anniversary is next day when you are born at night", () {
    expect(gigasecond.date(), equals(expectedDate));
  });
}

void unixEpochTests() {
  setUp(() {
    birthDate = new DateTime.utc(1959, DateTime.JULY, 19, 5, 13, 45);
    gigasecond = new Gigasecond(birthDate);
    expectedDate = new DateTime.utc(1991, DateTime.MARCH, 27, 7, 0, 25);
  });

  test("even works before 1970 (beginning of Unix epoch)", () {
    expect(gigasecond.date(), equals(expectedDate));
  });
}
