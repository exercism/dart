import 'package:test/test.dart';
import 'package:space_age/space_age.dart';

final SpaceAge myAge = new SpaceAge();

void main() {
  group("SpaceAge", ageOnPlanetTests);
}

void ageOnPlanetTests() {
  test("age on Earth", () {
    expect(myAge.age(planet: "Earth", seconds: 1000000000), equals(31.69));
  });

  test("age on Mercury", () {
    expect(myAge.age(planet: "Mercury", seconds: 2134835688), equals(280.88));
  }, skip: true);

  test("age on Venus", () {
    expect(myAge.age(planet: "Venus", seconds: 189839836), equals(9.78));
  }, skip: true);

  test("age on Mars", () {
    expect(myAge.age(planet: "Mars", seconds: 2329871239), equals(39.25));
  }, skip: true);

  test("age on Jupiter", () {
    expect(myAge.age(planet: "Jupiter", seconds: 901876382), equals(2.41));
  }, skip: true);

  test("age on Saturn", () {
    expect(myAge.age(planet: "Saturn", seconds: 3000000000), equals(3.23));
  }, skip: true);

  test("age on Uranus", () {
    expect(myAge.age(planet: "Uranus", seconds: 3210123456), equals(1.21));
  }, skip: true);

  test("age on Neptune", () {
    expect(myAge.age(planet: "Neptune", seconds: 8210123456), equals(1.58));
  }, skip: true);
}
