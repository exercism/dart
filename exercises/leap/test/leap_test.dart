import "package:test/test.dart";
import "package:leap/leap.dart";

void main() {
  group("Year", () {
    test("is not very common", () {
      final year = new Year(2015);

      expect(year.isLeap(), equals(false));
    });

    test("is introduced every 4 years to adjust about a day", () {
      final year = new Year(2020);

      expect(year.isLeap(), equals(true));
    }, skip: true);

    test("is skipped every 100 years to remove an extra day", () {
      final year = new Year(2100);

      expect(year.isLeap(), equals(false));
    }, skip: true);

    test("is reintroduced every 400 years to adjust another day", () {
      final year = new Year(2000);

      expect(year.isLeap(), equals(true));
    }, skip: true);
  });
}
