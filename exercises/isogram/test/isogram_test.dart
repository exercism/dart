import 'package:isogram/isogram.dart';
import 'package:test/test.dart';

void main() {
  final isogram = new Isogram();

  group('Isogram', () {
    group('Check if the given string is an isogram', () {
      test("empty string", () {
        final bool result = isogram.isIsogram("");
        expect(result, equals(true));
      }, skip: false);

      test("isogram with only lower case characters", () {
        final bool result = isogram.isIsogram("isogram");
        expect(result, equals(true));
      }, skip: true);

      test("word with one duplicated character", () {
        final bool result = isogram.isIsogram("eleven");
        expect(result, equals(false));
      }, skip: true);

      test("word with one duplicated character from the end of the alphabet", () {
        final bool result = isogram.isIsogram("zzyzx");
        expect(result, equals(false));
      }, skip: true);

      test("longest reported english isogram", () {
        final bool result = isogram.isIsogram("subdermatoglyphic");
        expect(result, equals(true));
      }, skip: true);

      test("word with duplicated character in mixed case", () {
        final bool result = isogram.isIsogram("Alphabet");
        expect(result, equals(false));
      }, skip: true);

      test("word with duplicated character in mixed case, lowercase first", () {
        final bool result = isogram.isIsogram("alphAbet");
        expect(result, equals(false));
      }, skip: true);

      test("hypothetical isogrammic word with hyphen", () {
        final bool result = isogram.isIsogram("thumbscrew-japingly");
        expect(result, equals(true));
      }, skip: true);

      test("isogram with duplicated hyphen", () {
        final bool result = isogram.isIsogram("six-year-old");
        expect(result, equals(true));
      }, skip: true);

      test("made-up name that is an isogram", () {
        final bool result = isogram.isIsogram("Emily Jung Schwartzkopf");
        expect(result, equals(true));
      }, skip: true);

      test("duplicated character in the middle", () {
        final bool result = isogram.isIsogram("accentor");
        expect(result, equals(false));
      }, skip: true);

      test("same first and last characters", () {
        final bool result = isogram.isIsogram("angola");
        expect(result, equals(false));
      }, skip: true);
    });
  });
}
