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

final fooBar = FooBar();

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
        expect(pubTemplate('foo bar', '1.0.0'), equals('''
name: 'foo_bar'
version: 1.0.0
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

    group('processing test cases', () {
      test('single case', () {
        List<Map<String, dynamic>> cases = <Map<String, dynamic>>[
          <String, dynamic>{
            "description": "Say Hi!",
            "property": "hello",
            "input": <String, dynamic>{},
            "expected": "Hello, World!"
          }
        ];

        Set<dynamic> actualSet = retrieveListOfExpected(cases);
        Set<String> expectedSet = Set.of(['Hello, World!']);

        expect(actualSet, equals(expectedSet));
      });

      test('multiple cases', () {
        List<Map<String, dynamic>> cases = <Map<String, dynamic>>[
          <String, dynamic>{
            "description": "year not divisible by 4 in common year",
            "property": "leapYear",
            "input": {"year": 2015},
            "expected": false
          },
          <String, dynamic>{
            "description": "year divisible by 2, not divisible by 4 in common year",
            "property": "leapYear",
            "input": {"year": 1970},
            "expected": false
          },
          <String, dynamic>{
            "description": "year divisible by 4, not divisible by 100 in leap year",
            "property": "leapYear",
            "input": {"year": 1996},
            "expected": true
          },
          <String, dynamic>{
            "description": "year divisible by 100, not divisible by 400 in common year",
            "property": "leapYear",
            "input": {"year": 2100},
            "expected": false
          },
          <String, dynamic>{
            "description": "year divisible by 400 in leap year",
            "property": "leapYear",
            "input": {"year": 2000},
            "expected": true
          },
          <String, dynamic>{
            "description": "year divisible by 200, not divisible by 400 in common year",
            "property": "leapYear",
            "input": {"year": 1800},
            "expected": false
          }
        ];

        Set<dynamic> actualSet = retrieveListOfExpected(cases);
        Set<bool> expectedSet = Set.of([false, true]);

        expect(actualSet, equals(expectedSet));
      });

      test('nested case', () {
        List<Map<String, dynamic>> cases = <Map<String, dynamic>>[
          <String, dynamic>{
            "description": "Check if the given string is an isogram",
            "comments": ["Output should be a boolean denoting if the string is a isogram or not."],
            "cases": [
              {
                "description": "empty string",
                "property": "isIsogram",
                "input": {"phrase": ""},
                "expected": true
              }
            ]
          }
        ];

        Set<dynamic> actualSet = retrieveListOfExpected(cases);
        Set<bool> expectedSet = Set.of([true]);

        expect(actualSet, equals(expectedSet));
      });

      test('three nested cases', () {
        List<Map<String, dynamic>> cases = <Map<String, dynamic>>[
          <String, dynamic>{
            "description": "Square the sum of the numbers up to the given number",
            "cases": [
              {
                "description": "square of sum 1",
                "property": "squareOfSum",
                "input": {"number": 1},
                "expected": 1
              },
              {
                "description": "square of sum 5",
                "property": "squareOfSum",
                "input": {"number": 5},
                "expected": 225
              },
              {
                "description": "square of sum 100",
                "property": "squareOfSum",
                "input": {"number": 100},
                "expected": 25502500
              }
            ]
          },
          <String, dynamic>{
            "description": "Sum the squares of the numbers up to the given number",
            "cases": [
              {
                "description": "sum of squares 1",
                "property": "sumOfSquares",
                "input": {"number": 1},
                "expected": 1
              },
              {
                "description": "sum of squares 5",
                "property": "sumOfSquares",
                "input": {"number": 5},
                "expected": 55
              },
              {
                "description": "sum of squares 100",
                "property": "sumOfSquares",
                "input": {"number": 100},
                "expected": 338350
              }
            ]
          },
          <String, dynamic>{
            "description": "Subtract sum of squares from square of sums",
            "cases": [
              {
                "description": "difference of squares 1",
                "property": "differenceOfSquares",
                "input": {"number": 1},
                "expected": 0
              },
              {
                "description": "difference of squares 5",
                "property": "differenceOfSquares",
                "input": {"number": 5},
                "expected": 170
              },
              {
                "description": "difference of squares 100",
                "property": "differenceOfSquares",
                "input": {"number": 100},
                "expected": 25164150
              }
            ]
          }
        ];

        Set<dynamic> actualSet = retrieveListOfExpected(cases);
        Set<int> expectedSet = Set.of([1, 225, 25502500, 55, 338350, 0, 170, 25164150]);

        expect(actualSet, equals(expectedSet));
      });

      test('uneven nested cases', () {
        List<Map<String, dynamic>> cases = <Map<String, dynamic>>[
          <String, dynamic>{
            "description": "data is retained",
            "property": "data",
            "input": {
              "treeData": ["4"]
            },
            "expected": {"data": "4", "left": null, "right": null}
          },
          <String, dynamic>{
            "description": "insert data at proper node",
            "cases": [
              {
                "description": "smaller number at left node",
                "property": "data",
                "input": {
                  "treeData": ["4", "2"]
                },
                "expected": {
                  "data": "4",
                  "left": {"data": "2", "left": null, "right": null},
                  "right": null
                }
              },
              {
                "description": "same number at left node",
                "property": "data",
                "input": {
                  "treeData": ["4", "4"]
                },
                "expected": {
                  "data": "4",
                  "left": {"data": "4", "left": null, "right": null},
                  "right": null
                }
              },
              {
                "description": "greater number at right node",
                "property": "data",
                "input": {
                  "treeData": ["4", "5"]
                },
                "expected": {
                  "data": "4",
                  "left": null,
                  "right": {"data": "5", "left": null, "right": null}
                }
              }
            ]
          }
        ];

        Set<dynamic> actualSet = retrieveListOfExpected(cases);
        Set<Map<String, dynamic>> expectedSet = Set.of([
          <String, dynamic>{"data": "4", "left": null, "right": null},
          <String, dynamic>{
            "data": "4",
            "left": {"data": "2", "left": null, "right": null},
            "right": null
          },
          <String, dynamic>{
            "data": "4",
            "left": {"data": "4", "left": null, "right": null},
            "right": null
          },
          <String, dynamic>{
            "data": "4",
            "left": null,
            "right": {"data": "5", "left": null, "right": null}
          }
        ]);

        expect(actualSet, equals(expectedSet));
      });

      test('case with an expected error', () {
        List<Map<String, dynamic>> cases = <Map<String, dynamic>>[
          <String, dynamic>{
            "description": "zero is an error",
            "property": "steps",
            "input": {"number": 0},
            "expected": {"error": "Only positive numbers are allowed"}
          }
        ];

        Set<dynamic> actualSet = retrieveListOfExpected(cases);
        Set<dynamic> expectedSet = Set<dynamic>();

        expect(actualSet, equals(expectedSet));
      });
    });
  });
}
