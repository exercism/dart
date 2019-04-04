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

    group('templates', () {
      test('exampleTemplate', () {
        expect(exampleTemplate('foo bar'), equals('''
class FooBar {

}
'''));
      });

      test('mainTemplate', () {
        expect(mainTemplate('foo bar'), equals('''
class FooBar {
  // Put your code here
}
'''));
      });

      test('testTemplate', () {
        expect(testTemplate('foo bar'), equals('''
import 'package:foo_bar/foo_bar.dart';
import 'package:test/test.dart';

final fooBar = new FooBar();

void main() {
  group('FooBar', () {
    test('should work', () {
      // TODO
    });
  });
}
'''));
      });

      test('pubTemplate', () {
        expect(pubTemplate('foo bar'), equals('''
name: 'foo_bar'
environment:
  sdk: '>=2.0.0 <3.0.0'
dev_dependencies:
  test: '<2.0.0'
'''));
      });

      test('analysisOptionsTemplate', () {
        expect(analysisOptionsTemplate(), equals('''
analyzer:
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false
  errors:
    unused_element:        error
    unused_import:         error
    unused_local_variable: error
    dead_code:             error

linter:
  rules:
    # Error Rules
    - avoid_relative_lib_imports
    - avoid_types_as_parameter_names
    - literal_only_boolean_expressions
    - no_adjacent_strings_in_list
    - valid_regexps
'''));
      });

      group('testCaseTemplate tests', () {
        test('simple test for a single case', () {
          Map<String, dynamic> testCase = <String, dynamic>{
            "description": "Zero is an Armstrong number",
            "property": "isArmstrongNumber",
            "input": {"number": 0},
            "expected": true
          };

          expect(testCaseTemplate('armstrong-numbers', testCase), equals('''
    test('${testCase['description']}', () {
      final null result = armstrongNumbers.${testCase['property']}(${testCase['input']['number']});
      expect(result, equals(${testCase['expected']}));
    }, skip: false);
'''));
        });
      });
    });
  });
}
