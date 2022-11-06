import 'package:acronym/acronym.dart';
import 'package:test/test.dart';

void main() {
  final acronym = Acronym();

  group('Acronym', () {
    test('basic', () {
      final result = acronym.abbreviate('Portable Network Graphics');
      expect(result, equals('PNG'));
    }, skip: false);

    test('lowercase words', () {
      final result = acronym.abbreviate('Ruby on Rails');
      expect(result, equals('ROR'));
    }, skip: true);

    test('punctuation', () {
      final result = acronym.abbreviate('First In, First Out');
      expect(result, equals('FIFO'));
    }, skip: true);

    test('all caps word', () {
      final result = acronym.abbreviate('GNU Image Manipulation Program');
      expect(result, equals('GIMP'));
    }, skip: true);

    test('punctuation without whitespace', () {
      final result = acronym.abbreviate('Complementary metal-oxide semiconductor');
      expect(result, equals('CMOS'));
    }, skip: true);

    test('very long abbreviation', () {
      final result = acronym.abbreviate('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me');
      expect(result, equals('ROTFLSHTMDCOALM'));
    }, skip: true);

    test('consecutive delimiters', () {
      final result = acronym.abbreviate('Something - I made up from thin air');
      expect(result, equals('SIMUFTA'));
    }, skip: true);

    test('apostrophes', () {
      final result = acronym.abbreviate('Halley\'s Comet');
      expect(result, equals('HC'));
    }, skip: true);

    test('underscore emphasis', () {
      final result = acronym.abbreviate('The Road _Not_ Taken');
      expect(result, equals('TRNT'));
    }, skip: true);
  });
}
