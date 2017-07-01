import "package:test/test.dart";
import "package:gigasecond/gigasecond.dart";

void main() {
  group("Gigasecond", () {
    test("tells a gigasecond anniversary since midnight", () {
      final birthDate = new DateTime.utc(2015, DateTime.SEPTEMBER, 14);
      final expectedDate = new DateTime.utc(2047, DateTime.MAY, 23, 1, 46, 40);
      final gigasecond = new Gigasecond(birthDate);

      expect(gigasecond.date(), equals(expectedDate));
    });

    test("tells the anniversary is next day when you are born at night", () {
      final birthDate = new DateTime.utc(2015, DateTime.SEPTEMBER, 14, 23, 59, 59);
      final expectedDate = new DateTime.utc(2047, DateTime.MAY, 24, 1, 46, 39);
      final gigasecond = new Gigasecond(birthDate);

      expect(gigasecond.date(), equals(expectedDate));
    }, skip: true);

    test("even works before 1970 (beginning of Unix epoch)", () {
      final birthDate = new DateTime.utc(1959, DateTime.JULY, 19, 5, 13, 45);
      final expectedDate = new DateTime.utc(1991, DateTime.MARCH, 27, 7, 0, 25);
      final gigasecond = new Gigasecond(birthDate);

      expect(gigasecond.date(), equals(expectedDate));
    }, skip: true);

    test("make sure calling \"date\" doesn\"t mutate value", () {
      final birthDate = new DateTime.utc(1959, DateTime.JULY, 19, 5, 13, 45);
      final expectedDate = new DateTime.utc(1991, DateTime.MARCH, 27, 7, 0, 25);
      final gigasecond = new Gigasecond(birthDate);

      gigasecond.date();
      expect(gigasecond.date(), equals(expectedDate));
    }, skip: true);
  });
}
