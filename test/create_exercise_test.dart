import 'package:test/test.dart';
import '../tool/create_exercise.dart';

void main() {
  group('create-exercise tool', () {
    group('helpers', () {
      test('words()', () {
        expect(words(null), equals(['']));
        expect(words(''), equals(['']));
        expect(words('foobar'), equals(['foobar']));
        expect(words('FOOBAR'), equals(['foobar']));
        expect(words('foo bar'), equals(['foo', 'bar']));
        expect(words('foo bar...123'), equals(['foo', 'bar', '123']));
        expect(words('foo@bar'), equals(['foo', 'bar']));
        expect(words('   foo  bar '), equals(['foo', 'bar']));
        expect(words('<foobar>'), equals(['foobar']));
      });

      test('upperFirst()', () {
        expect(upperFirst(null), equals(''));
        expect(upperFirst(''), equals(''));
        expect(upperFirst('a'), equals('A'));
        expect(upperFirst('A'), equals('A'));
        expect(upperFirst('0'), equals('0'));
        expect(upperFirst('?'), equals('?'));
        expect(upperFirst('foobar'), equals('Foobar'));
        expect(upperFirst('Foobar'), equals('Foobar'));
        expect(upperFirst('foo bar'), equals('Foo bar'));
      });

      test('camelCase()', () {
        expect(camelCase('foobar'), equals('foobar'));
        expect(camelCase('foobar', isUpperFirst: true), equals('Foobar'));
        expect(camelCase('foo bar'), equals('fooBar'));
        expect(camelCase('foo bar', isUpperFirst: true), equals('FooBar'));
      });

      test('pascalCase()', () {
        expect(pascalCase('foobar'), equals('Foobar'));
        expect(pascalCase('foo bar'), equals('FooBar'));
      });

      test('snakeCase()', () {
        expect(snakeCase('foo bar'), equals('foo_bar'));
        expect(snakeCase('foo-bar'), equals('foo_bar'));
      });

      test('kebabCase()', () {
        expect(kebabCase('foo bar'), equals('foo-bar'));
        expect(kebabCase('foo_bar'), equals('foo-bar'));
      });
    });
  });
}
