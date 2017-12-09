import 'package:test/test.dart';
import '../bin/create_exercise.dart';

void main() {
  group('create-exercise tool', () {
    group('helpers', () {
      group('words', () {
        test('null returns empty list', () {
          expect(words(null), equals(['']));
        });

        test('empty string returns empty list', () {
          expect(words(''), equals(['']));
        });

        test('single word returns list with single element', () {
          expect(words('foobar'), equals(['foobar']));
        });

        test('upper case characters are converted to lower case', () {
          expect(words('FOOBAR'), equals(['foobar']));
        });

        test('words separated by a space become individual list elements', () {
          expect(words('foo bar'), equals(['foo', 'bar']));
        });

        test('all symbols are replaced by a space', () {
          expect(words('foo@bar'), equals(['foo', 'bar']));
        });

        test('words can only contain letters and digits', () {
          expect(words('foo bar...123'), equals(['foo', 'bar', '123']));
        });

        test('multiple occurrences of spaces are trimmed', () {
          expect(words('   foo  bar '), equals(['foo', 'bar']));
        });

        test('all symbols are discarded', () {
          expect(words('<foobar>'), equals(['foobar']));
        });
      });

      group('upperFirst()', () {
        test('null returns empty string', () {
          expect(upperFirst(null), equals(''));
        });

        test('empty string returns empty string', () {
          expect(upperFirst(''), equals(''));
        });

        test('a single lower case character is converted to upper case', () {
          expect(upperFirst('a'), equals('A'));
        });

        test('a single upper case character remains upper case', () {
          expect(upperFirst('A'), equals('A'));
        });

        test('a digit remains the same', () {
          expect(upperFirst('0'), equals('0'));
        });

        test('a symbol remains the same', () {
          expect(upperFirst('?'), equals('?'));
        });

        test('a lower case string returns the same string capitalized', () {
          expect(upperFirst('foobar'), equals('Foobar'));
        });

        test('a capitalized string remains the same', () {
          expect(upperFirst('Foobar'), equals('Foobar'));
        });

        test('only the first word in a string is capitalized', () {
          expect(upperFirst('foo bar'), equals('Foo bar'));
        });
      });

      group('camelCase()', () {
        test('a lower case string remains the same', () {
          expect(camelCase('foobar'), equals('foobar'));
        });

        test('returns capitalized string if isUpperFirst is true', () {
          expect(camelCase('foobar', isUpperFirst: true), equals('Foobar'));
        });

        test('every word after the first is capitalized', () {
          expect(camelCase('foo bar'), equals('fooBar'));
        });

        test('every word is capitalized if isUpperFirst is true', () {
          expect(camelCase('foo bar', isUpperFirst: true), equals('FooBar'));
        });
      });

      group('pascalCase()', () {
        test('the first character is converted to upper case', () {
          expect(pascalCase('foobar'), equals('Foobar'));
        });

        test('every word is capitalized', () {
          expect(pascalCase('foo bar'), equals('FooBar'));
        });
      });

      group('snakeCase()', () {
        test('every word is separated by an underscore', () {
          expect(snakeCase('foo bar'), equals('foo_bar'));
        });

        test('symbols are replaced by an underscore', () {
          expect(snakeCase('foo-bar'), equals('foo_bar'));
        });
      });

      group('kebabCase()', () {
        test('every word is separated by a dash', () {
          expect(kebabCase('foo bar'), equals('foo-bar'));
        });

        test('symbols are replaced by a dash', () {
          expect(kebabCase('foo_bar'), equals('foo-bar'));
        });
      });
    });
  });
}
