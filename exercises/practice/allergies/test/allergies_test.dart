import 'package:allergies/allergies.dart';
import 'package:test/test.dart';

final allergies = Allergies();

void main() {
  group('Allergies', () {
    group('testing for eggs allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('eggs', 0);
        expect(result, equals(false));
      }, skip: false);

      test('allergic only to eggs', () {
        final bool result = allergies.allergicTo('eggs', 1);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to eggs and something else', () {
        final bool result = allergies.allergicTo('eggs', 3);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not eggs', () {
        final bool result = allergies.allergicTo('eggs', 2);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('eggs', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('testing for peanuts allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('peanuts', 0);
        expect(result, equals(false));
      }, skip: true);

      test('allergic only to peanuts', () {
        final bool result = allergies.allergicTo('peanuts', 2);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to peanuts and something else', () {
        final bool result = allergies.allergicTo('peanuts', 7);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not peanuts', () {
        final bool result = allergies.allergicTo('peanuts', 5);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('peanuts', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('testing for shellfish allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('shellfish', 0);
        expect(result, equals(false));
      }, skip: true);

      test('allergic only to shellfish', () {
        final bool result = allergies.allergicTo('shellfish', 4);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to shellfish and something else', () {
        final bool result = allergies.allergicTo('shellfish', 14);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not shellfish', () {
        final bool result = allergies.allergicTo('shellfish', 10);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('shellfish', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('testing for strawberries allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('strawberries', 0);
        expect(result, equals(false));
      }, skip: true);

      test('allergic only to strawberries', () {
        final bool result = allergies.allergicTo('strawberries', 8);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to strawberries and something else', () {
        final bool result = allergies.allergicTo('strawberries', 28);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not strawberries', () {
        final bool result = allergies.allergicTo('strawberries', 20);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('strawberries', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('testing for tomatoes allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('tomatoes', 0);
        expect(result, equals(false));
      }, skip: true);

      test('allergic only to tomatoes', () {
        final bool result = allergies.allergicTo('tomatoes', 16);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to tomatoes and something else', () {
        final bool result = allergies.allergicTo('tomatoes', 56);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not tomatoes', () {
        final bool result = allergies.allergicTo('tomatoes', 40);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('tomatoes', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('testing for chocolate allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('chocolate', 0);
        expect(result, equals(false));
      }, skip: true);

      test('allergic only to chocolate', () {
        final bool result = allergies.allergicTo('chocolate', 32);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to chocolate and something else', () {
        final bool result = allergies.allergicTo('chocolate', 112);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not chocolate', () {
        final bool result = allergies.allergicTo('chocolate', 80);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('chocolate', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('testing for pollen allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('pollen', 0);
        expect(result, equals(false));
      }, skip: true);

      test('allergic only to pollen', () {
        final bool result = allergies.allergicTo('pollen', 64);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to pollen and something else', () {
        final bool result = allergies.allergicTo('pollen', 224);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not pollen', () {
        final bool result = allergies.allergicTo('pollen', 160);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('pollen', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('testing for cats allergy', () {
      test('not allergic to anything', () {
        final bool result = allergies.allergicTo('cats', 0);
        expect(result, equals(false));
      }, skip: true);

      test('allergic only to cats', () {
        final bool result = allergies.allergicTo('cats', 128);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to cats and something else', () {
        final bool result = allergies.allergicTo('cats', 192);
        expect(result, equals(true));
      }, skip: true);

      test('allergic to something, but not cats', () {
        final bool result = allergies.allergicTo('cats', 64);
        expect(result, equals(false));
      }, skip: true);

      test('allergic to everything', () {
        final bool result = allergies.allergicTo('cats', 255);
        expect(result, equals(true));
      }, skip: true);
    });

    group('list when:', () {
      test('no allergies', () {
        final List<String> result = allergies.list(0);
        expect(result, equals(<String>[]));
      }, skip: true);

      test('just eggs', () {
        final List<String> result = allergies.list(1);
        expect(result, equals(<String>['eggs']));
      }, skip: true);

      test('just peanuts', () {
        final List<String> result = allergies.list(2);
        expect(result, equals(<String>['peanuts']));
      }, skip: true);

      test('just strawberries', () {
        final List<String> result = allergies.list(8);
        expect(result, equals(<String>['strawberries']));
      }, skip: true);

      test('eggs and peanuts', () {
        final List<String> result = allergies.list(3);
        expect(result, equals(<String>['eggs', 'peanuts']));
      }, skip: true);

      test('more than eggs but not peanuts', () {
        final List<String> result = allergies.list(5);
        expect(result, equals(<String>['eggs', 'shellfish']));
      }, skip: true);

      test('lots of stuff', () {
        final List<String> result = allergies.list(248);
        expect(result, equals(<String>['strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']));
      }, skip: true);

      test('everything', () {
        final List<String> result = allergies.list(255);
        expect(
            result,
            equals(
                <String>['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']));
      }, skip: true);

      test('no allergen score parts', () {
        final List<String> result = allergies.list(509);
        expect(
            result, equals(<String>['eggs', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']));
      }, skip: true);
    });
  });
}
