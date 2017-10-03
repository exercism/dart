import "package:test/test.dart";
import "package:raindrops/raindrops.dart";

void main() {
  final raindrops = new Raindrops();

  group("Raindrops", () {
    test("the sound for 1 is 1", () {
      expect(raindrops.convert(1), equals("1"));
    }, skip: false);
    test("the sound for 3 is Pling", () {
      expect(raindrops.convert(3), equals("Pling"));
    }, skip: true);
    test("the sound for 5 is Plang", () {
      expect(raindrops.convert(5), equals("Plang"));
    }, skip: true);
    test("the sound for 7 is Plong", () {
      expect(raindrops.convert(7), equals("Plong"));
    }, skip: true);
    test("the sound for 6 is Pling as it has a factor 3", () {
      expect(raindrops.convert(6), equals("Pling"));
    }, skip: true);
    test("2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base", () {
      expect(raindrops.convert(8), equals("8"));
    }, skip: true);
    test("the sound for 9 is Pling as it has a factor 3", () {
      expect(raindrops.convert(9), equals("Pling"));
    }, skip: true);
    test("the sound for 10 is Plang as it has a factor 5", () {
      expect(raindrops.convert(10), equals("Plang"));
    }, skip: true);
    test("the sound for 14 is Plong as it has a factor of 7", () {
      expect(raindrops.convert(14), equals("Plong"));
    }, skip: true);
    test("the sound for 15 is PlingPlang as it has factors 3 and 5", () {
      expect(raindrops.convert(15), equals("PlingPlang"));
    }, skip: true);
    test("the sound for 21 is PlingPlong as it has factors 3 and 7", () {
      expect(raindrops.convert(21), equals("PlingPlong"));
    }, skip: true);
    test("the sound for 25 is Plang as it has a factor 5", () {
      expect(raindrops.convert(25), equals("Plang"));
    }, skip: true);
    test("the sound for 27 is Pling as it has a factor 3", () {
      expect(raindrops.convert(27), equals("Pling"));
    }, skip: true);
    test("the sound for 35 is PlangPlong as it has factors 5 and 7", () {
      expect(raindrops.convert(35), equals("PlangPlong"));
    }, skip: true);
    test("the sound for 49 is Plong as it has a factor 7", () {
      expect(raindrops.convert(49), equals("Plong"));
    }, skip: true);
    test("the sound for 52 is 52", () {
      expect(raindrops.convert(52), equals("52"));
    }, skip: true);
    test("the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7", () {
      expect(raindrops.convert(105), equals("PlingPlangPlong"));
    }, skip: true);
    test("the sound for 3125 is Plang as it has a factor 5", () {
      expect(raindrops.convert(3215), equals("Plang"));
    }, skip: true);
  });
}
