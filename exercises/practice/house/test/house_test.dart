import 'package:house/house.dart';
import 'package:test/test.dart';

void main() {
  final house = House();

  group('House', () {
    test('verse one - the house that Jack built', () {
      final startVerse = 1;
      final endVerse = 1;
      final result = house.recite(startVerse, endVerse);
      final expected = 'This is the house that Jack built.';
      expect(result, equals(expected));
    }, skip: false);

    test('verse two - the malt that lay', () {
      final startVerse = 2;
      final endVerse = 2;
      final result = house.recite(startVerse, endVerse);
      final expected =
          'This is the malt that lay in the house that Jack built.';
      expect(result, equals(expected));
    }, skip: true);

    test('verse three - the rat that ate', () {
      final startVerse = 3;
      final endVerse = 3;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse four - the cat that killed', () {
      final startVerse = 4;
      final endVerse = 4;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse five - the dog that worried', () {
      final startVerse = 5;
      final endVerse = 5;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse six - the cow with the crumpled horn', () {
      final startVerse = 6;
      final endVerse = 6;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse seven - the maiden all forlorn', () {
      final startVerse = 7;
      final endVerse = 7;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the maiden all forlorn',
        'that milked the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse eight - the man all tattered and torn', () {
      final startVerse = 8;
      final endVerse = 8;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the man all tattered and torn',
        'that kissed the maiden all forlorn',
        'that milked the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse nine - the priest all shaven and shorn', () {
      final startVerse = 9;
      final endVerse = 9;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the priest all shaven and shorn',
        'that married the man all tattered and torn',
        'that kissed the maiden all forlorn',
        'that milked the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse ten - the rooster that crowed in the morn', () {
      final startVerse = 10;
      final endVerse = 10;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the rooster that crowed in the morn',
        'that woke the priest all shaven and shorn',
        'that married the man all tattered and torn',
        'that kissed the maiden all forlorn',
        'that milked the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse eleven - the farmer sowing his corn', () {
      final startVerse = 11;
      final endVerse = 11;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the farmer sowing his corn',
        'that kept the rooster that crowed in the morn',
        'that woke the priest all shaven and shorn',
        'that married the man all tattered and torn',
        'that kissed the maiden all forlorn',
        'that milked the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('verse 12 - the horse and the hound and the horn', () {
      final startVerse = 12;
      final endVerse = 12;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the horse and the hound and the horn',
        'that belonged to the farmer sowing his corn',
        'that kept the rooster that crowed in the morn',
        'that woke the priest all shaven and shorn',
        'that married the man all tattered and torn',
        'that kissed the maiden all forlorn',
        'that milked the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      expect(result, equals(expected));
    }, skip: true);

    test('multiple verses', () {
      final startVerse = 4;
      final endVerse = 8;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        [
          'This is the cat that killed the rat',
          'that ate the malt that lay in the house',
          'that Jack built.',
        ].join(' '),
        [
          'This is the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the man all tattered and torn',
          'that kissed the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
      ].join('\n');
      expect(result, equals(expected));
    }, skip: true);

    test('full rhyme', () {
      final startVerse = 1;
      final endVerse = 12;
      final result = house.recite(startVerse, endVerse);
      final expected = [
        'This is the house that Jack built.',
        'This is the malt that lay in the house that Jack built.',
        [
          'This is the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the cat that killed the rat',
          'that ate the malt that lay in the house',
          'that Jack built.',
        ].join(' '),
        [
          'This is the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the man all tattered and torn',
          'that kissed the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the priest all shaven and shorn',
          'that married the man all tattered and torn',
          'that kissed the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the rooster that crowed in the morn',
          'that woke the priest all shaven and shorn',
          'that married the man all tattered and torn',
          'that kissed the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the farmer sowing his corn',
          'that kept the rooster that crowed in the morn',
          'that woke the priest all shaven and shorn',
          'that married the man all tattered and torn',
          'that kissed the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
        [
          'This is the horse and the hound and the horn',
          'that belonged to the farmer sowing his corn',
          'that kept the rooster that crowed in the morn',
          'that woke the priest all shaven and shorn',
          'that married the man all tattered and torn',
          'that kissed the maiden all forlorn',
          'that milked the cow with the crumpled horn',
          'that tossed the dog that worried the cat',
          'that killed the rat that ate the malt',
          'that lay in the house that Jack built.',
        ].join(' '),
      ].join('\n');
      expect(result, equals(expected));
    }, skip: true);
  });
}
