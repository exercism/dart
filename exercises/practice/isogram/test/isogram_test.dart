import 'package:isogram/isogram.dart';
import 'package:test/test.dart';

void main() {
  final isogram = Isogram();

  group('Isogram', () {
    test('empty string', () {
      final result = isogram.isIsogram('');
      expect(result, equals(true));
    }, skip: false);

    test('isogram with only lower case characters', () {
      final result = isogram.isIsogram('isogram');
      expect(result, equals(true));
    }, skip: true);

    test('word with one duplicated character', () {
      final result = isogram.isIsogram('eleven');
      expect(result, equals(false));
    }, skip: true);

    test('word with one duplicated character from the end of the alphabet', () {
      final result = isogram.isIsogram('zzyzx');
      expect(result, equals(false));
    }, skip: true);

    test('longest reported english isogram', () {
      final result = isogram.isIsogram('subdermatoglyphic');
      expect(result, equals(true));
    }, skip: true);

    test('word with duplicated character in mixed case', () {
      final result = isogram.isIsogram('Alphabet');
      expect(result, equals(false));
    }, skip: true);

    test('word with duplicated character in mixed case, lowercase first', () {
      final result = isogram.isIsogram('alphAbet');
      expect(result, equals(false));
    }, skip: true);

    test('hypothetical isogrammic word with hyphen', () {
      final result = isogram.isIsogram('thumbscrew-japingly');
      expect(result, equals(true));
    }, skip: true);

    test('hypothetical word with duplicated character following hyphen', () {
      final result = isogram.isIsogram('thumbscrew-jappingly');
      expect(result, equals(false));
    }, skip: true);

    test('isogram with duplicated hyphen', () {
      final result = isogram.isIsogram('six-year-old');
      expect(result, equals(true));
    }, skip: true);

    test('made-up name that is an isogram', () {
      final result = isogram.isIsogram('Emily Jung Schwartzkopf');
      expect(result, equals(true));
    }, skip: true);

    test('duplicated character in the middle', () {
      final result = isogram.isIsogram('accentor');
      expect(result, equals(false));
    }, skip: true);

    test('same first and last characters', () {
      final result = isogram.isIsogram('angola');
      expect(result, equals(false));
    }, skip: true);

    test('word with duplicated character and with two hyphens', () {
      final result = isogram.isIsogram('up-to-date');
      expect(result, equals(false));
    }, skip: true);
  });
}
