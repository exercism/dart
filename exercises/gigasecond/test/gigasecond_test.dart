import "package:test/test.dart";
import "package:gigasecond/gigasecond.dart";

void main() {
  DateTime birthDate;
  DateTime expectedDate;
  Gigasecond gigasecond;

  group("Gigasecond", () {
    setUp(() {
      birthDate = new DateTime.utc(2015, DateTime.SEPTEMBER, 14);
    });

    group("Since midnight", () {
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
    });

    group("At night", () {
      setUp(() {
        birthDate = birthDate.add(new Duration(hours: 23, minutes: 59, seconds: 59));
        gigasecond = new Gigasecond(birthDate);
        expectedDate = new DateTime.utc(2047, DateTime.MAY, 24, 1, 46, 39);
      });

      test("tells the anniversary is next day when you are born at night", () {
        expect(gigasecond.date(), equals(expectedDate));
      });
    });

    group("Unix epoch", () {
      setUp(() {
        birthDate = new DateTime.utc(1959, DateTime.JULY, 19, 5, 13, 45);
        gigasecond = new Gigasecond(birthDate);
        expectedDate = new DateTime.utc(1991, DateTime.MARCH, 27, 7, 0, 25);
      });

      test("even works before 1970 (beginning of Unix epoch)", () {
        expect(gigasecond.date(), equals(expectedDate));
      });
    });
  });
}
