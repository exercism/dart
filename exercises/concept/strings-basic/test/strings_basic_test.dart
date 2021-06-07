import 'package:strings_basic/strings_basic.dart';
import 'package:test/test.dart';

void main() {
  group('Basic String Operations', () {
    group('length', () {
      test('Get the length', () {
        final size = getLength('I have 4 cats');
        expect(size, equals(13));
      });
    });

    group('Check emptiness of string', () {
      test('Check an empty string, expecting an empty string', () {
        final result = isEmptyString('');
        expect(result, isTrue);
      });

      test('Check a non-empty string, expecting an empty string', () {
        final result = isEmptyString('onomatopoeia');
        expect(result, isFalse);
      });

      test('Check a non-empty string, expecting a non-empty string', () {
        final result = isNotEmptyString('onomatopoeia');
        expect(result, isTrue);
      });

      test('Check an empty string, expecting a non-empty string', () {
        final result = isNotEmptyString('');
        expect(result, isFalse);
      });
    });

    group('string operators', () {
      group('Concatenation', () {
        test('Combine two strings', () {
          final result = concatenate('I have', ' 4 cats');
          expect(result, equals('I have 4 cats'));
        });
      });
    });

    group('Self-concatenation', () {
      test('Combine a string to itself', () {
        final result = multiply('boo hoo ');
        expect(result, equals('boo hoo boo hoo '));
      });

      test('Combine a string to itself 0 times', () {
        final result = multiply('boo hoo ', 0);
        expect(result, equals(''));
      });

      test('Combine a string to itself 3 times', () {
        final result = multiply('boo hoo ', 3);
        expect(result, equals('boo hoo boo hoo boo hoo '));
      });

      test('Combine a string to itself 1 time', () {
        final result = multiply('boo hoo ', 1);
        expect(result, equals('boo hoo '));
      });
    });

    group('Using the indexes of a string', () {
      test('Get the first character in the string', () {
        final result = getCharacter('boo hoo ', 0);
        expect(result, equals('b'));
      });
    });
  });
}
