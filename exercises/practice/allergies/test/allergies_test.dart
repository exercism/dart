import 'package:allergies/allergies.dart';
import 'package:test/test.dart';

final allergies = Allergies();

void main() {
  group('Allergies: testing for eggs allergy - ', testingForEggsAllergy);
  group('Allergies: testing for peanuts allergy - ', testingForPeanutsAllergy);
  group('Allergies: testing for shellfish allergy - ', testingForShellfishAllergy);
  group('Allergies: testing for strawberries allergy - ', testingForStrawberriesAllergy);
  group('Allergies: testing for tomatoes allergy - ', testingForTomatoesAllergy);
  group('Allergies: testing for chocolate allergy - ', testingForChocolateAllergy);
  group('Allergies: testing for pollen allergy - ', testingForPollenAllergy);
  group('Allergies: testing for cats allergy - ', testingForCatsAllergy);
  group('Allergies: list when: - ', listWhen);
}

void testingForEggsAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('eggs', 0);
    expect(result, equals(false));
  }, skip: false);

  test('allergic only to eggs', () {
    final result = allergies.allergicTo('eggs', 1);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to eggs and something else', () {
    final result = allergies.allergicTo('eggs', 3);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not eggs', () {
    final result = allergies.allergicTo('eggs', 2);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('eggs', 255);
    expect(result, equals(true));
  }, skip: true);
}

void testingForPeanutsAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('peanuts', 0);
    expect(result, equals(false));
  }, skip: true);

  test('allergic only to peanuts', () {
    final result = allergies.allergicTo('peanuts', 2);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to peanuts and something else', () {
    final result = allergies.allergicTo('peanuts', 7);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not peanuts', () {
    final result = allergies.allergicTo('peanuts', 5);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('peanuts', 255);
    expect(result, equals(true));
  }, skip: true);
}

void testingForShellfishAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('shellfish', 0);
    expect(result, equals(false));
  }, skip: true);

  test('allergic only to shellfish', () {
    final result = allergies.allergicTo('shellfish', 4);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to shellfish and something else', () {
    final result = allergies.allergicTo('shellfish', 14);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not shellfish', () {
    final result = allergies.allergicTo('shellfish', 10);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('shellfish', 255);
    expect(result, equals(true));
  }, skip: true);
}

void testingForStrawberriesAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('strawberries', 0);
    expect(result, equals(false));
  }, skip: true);

  test('allergic only to strawberries', () {
    final result = allergies.allergicTo('strawberries', 8);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to strawberries and something else', () {
    final result = allergies.allergicTo('strawberries', 28);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not strawberries', () {
    final result = allergies.allergicTo('strawberries', 20);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('strawberries', 255);
    expect(result, equals(true));
  }, skip: true);
}

void testingForTomatoesAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('tomatoes', 0);
    expect(result, equals(false));
  }, skip: true);

  test('allergic only to tomatoes', () {
    final result = allergies.allergicTo('tomatoes', 16);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to tomatoes and something else', () {
    final result = allergies.allergicTo('tomatoes', 56);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not tomatoes', () {
    final result = allergies.allergicTo('tomatoes', 40);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('tomatoes', 255);
    expect(result, equals(true));
  }, skip: true);
}

void testingForChocolateAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('chocolate', 0);
    expect(result, equals(false));
  }, skip: true);

  test('allergic only to chocolate', () {
    final result = allergies.allergicTo('chocolate', 32);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to chocolate and something else', () {
    final result = allergies.allergicTo('chocolate', 112);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not chocolate', () {
    final result = allergies.allergicTo('chocolate', 80);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('chocolate', 255);
    expect(result, equals(true));
  }, skip: true);
}

void testingForPollenAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('pollen', 0);
    expect(result, equals(false));
  }, skip: true);

  test('allergic only to pollen', () {
    final result = allergies.allergicTo('pollen', 64);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to pollen and something else', () {
    final result = allergies.allergicTo('pollen', 224);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not pollen', () {
    final result = allergies.allergicTo('pollen', 160);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('pollen', 255);
    expect(result, equals(true));
  }, skip: true);
}

void testingForCatsAllergy() {
  test('not allergic to anything', () {
    final result = allergies.allergicTo('cats', 0);
    expect(result, equals(false));
  }, skip: true);

  test('allergic only to cats', () {
    final result = allergies.allergicTo('cats', 128);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to cats and something else', () {
    final result = allergies.allergicTo('cats', 192);
    expect(result, equals(true));
  }, skip: true);

  test('allergic to something, but not cats', () {
    final result = allergies.allergicTo('cats', 64);
    expect(result, equals(false));
  }, skip: true);

  test('allergic to everything', () {
    final result = allergies.allergicTo('cats', 255);
    expect(result, equals(true));
  }, skip: true);
}

void listWhen() {
  test('no allergies', () {
    final result = allergies.list(0);
    expect(result, equals(<String>[]));
  }, skip: true);

  test('just eggs', () {
    final result = allergies.list(1);
    expect(result, equals(<String>['eggs']));
  }, skip: true);

  test('just peanuts', () {
    final result = allergies.list(2);
    expect(result, equals(<String>['peanuts']));
  }, skip: true);

  test('just strawberries', () {
    final result = allergies.list(8);
    expect(result, equals(<String>['strawberries']));
  }, skip: true);

  test('eggs and peanuts', () {
    final result = allergies.list(3);
    expect(result, equals(<String>['eggs', 'peanuts']));
  }, skip: true);

  test('more than eggs but not peanuts', () {
    final result = allergies.list(5);
    expect(result, equals(<String>['eggs', 'shellfish']));
  }, skip: true);

  test('lots of stuff', () {
    final result = allergies.list(248);
    expect(result, equals(<String>['strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']));
  }, skip: true);

  test('everything', () {
    final result = allergies.list(255);
    expect(result,
        equals(<String>['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']));
  }, skip: true);

  test('no allergen score parts', () {
    final result = allergies.list(509);
    expect(result, equals(<String>['eggs', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']));
  }, skip: true);

  test('no allergen score parts without highest valid score', () {
    final result = allergies.list(257);
    expect(result, equals(<String>['eggs']));
  }, skip: true);
}
