import 'package:raindrops/raindrops.dart';
import 'package:test/test.dart';

final raindrops = Raindrops();

void main() {
  group('identity tests', identityTests);
  group('factor tests', factorTests);
  group('multiple factor tests', multipleFactorTests);
  group('edge case tests', edgeCaseTests);
}

void identityTests() {
  test('the sound for 1 is 1', () {
    final String result = raindrops.convert(1);
    expect(result, equals('1'));
  }, skip: false);

  test('the sound for 3 is Pling', () {
    final String result = raindrops.convert(3);
    expect(result, equals('Pling'));
  }, skip: true);

  test('the sound for 5 is Plang', () {
    final String result = raindrops.convert(5);
    expect(result, equals('Plang'));
  }, skip: true);

  test('the sound for 7 is Plong', () {
    final String result = raindrops.convert(7);
    expect(result, equals('Plong'));
  }, skip: true);
}

void factorTests() {
  test('the sound for 6 is Pling as it has a factor 3', () {
    final String result = raindrops.convert(6);
    expect(result, equals('Pling'));
  }, skip: true);

  test('2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base', () {
    final String result = raindrops.convert(8);
    expect(result, equals('8'));
  }, skip: true);

  test('the sound for 9 is Pling as it has a factor 3', () {
    final String result = raindrops.convert(9);
    expect(result, equals('Pling'));
  }, skip: true);

  test('the sound for 10 is Plang as it has a factor 5', () {
    final String result = raindrops.convert(10);
    expect(result, equals('Plang'));
  }, skip: true);

  test('the sound for 14 is Plong as it has a factor of 7', () {
    final String result = raindrops.convert(14);
    expect(result, equals('Plong'));
  }, skip: true);
}

void multipleFactorTests() {
  test('the sound for 15 is PlingPlang as it has factors 3 and 5', () {
    final String result = raindrops.convert(15);
    expect(result, equals('PlingPlang'));
  }, skip: true);

  test('the sound for 21 is PlingPlong as it has factors 3 and 7', () {
    final String result = raindrops.convert(21);
    expect(result, equals('PlingPlong'));
  }, skip: true);

  test('the sound for 35 is PlangPlong as it has factors 5 and 7', () {
    final String result = raindrops.convert(35);
    expect(result, equals('PlangPlong'));
  }, skip: true);

  test('the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7', () {
    final String result = raindrops.convert(105);
    expect(result, equals('PlingPlangPlong'));
  }, skip: true);
}

void edgeCaseTests() {
  test('the sound for 25 is Plang as it has a factor 5', () {
    final String result = raindrops.convert(25);
    expect(result, equals('Plang'));
  }, skip: true);

  test('the sound for 27 is Pling as it has a factor 3', () {
    final String result = raindrops.convert(27);
    expect(result, equals('Pling'));
  }, skip: true);

  test('the sound for 49 is Plong as it has a factor 7', () {
    final String result = raindrops.convert(49);
    expect(result, equals('Plong'));
  }, skip: true);

  test('the sound for 52 is 52', () {
    final String result = raindrops.convert(52);
    expect(result, equals('52'));
  }, skip: true);

  test('the sound for 3125 is Plang as it has a factor 5', () {
    final String result = raindrops.convert(3125);
    expect(result, equals('Plang'));
  }, skip: true);
}
