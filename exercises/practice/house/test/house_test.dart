import 'package:house/house.dart';
import 'package:test/test.dart';

void main() {
  final house = House();

  group('House', () {
    test('verse one - the house that Jack built', () {
      final expected = 'This is the house that Jack built.';
      final result = house.recite(1, 1);
      expect(result, equals(expected));
    }, skip: false);

    test('verse two - the malt that lay', () {
      final expected = 'This is the malt that lay in the house that Jack built.';
      final result = house.recite(2, 2);
      expect(result, equals(expected));
    }, skip: true);

    test('verse three - the rat that ate', () {
      final expected = [
        'This is the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      final result = house.recite(3, 3);
      expect(result, equals(expected));
    }, skip: true);

    test('verse four - the cat that killed', () {
      final expected = [
        'This is the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      final result = house.recite(4, 4);
      expect(result, equals(expected));
    }, skip: true);

    test('verse five - the dog that worried', () {
      final expected = [
        'This is the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      final result = house.recite(5, 5);
      expect(result, equals(expected));
    }, skip: true);

    test('verse six - the cow with the crumpled horn', () {
      final expected = [
        'This is the cow with the crumpled horn',
        'that tossed the dog',
        'that worried the cat',
        'that killed the rat',
        'that ate the malt',
        'that lay in the house',
        'that Jack built.',
      ].join(' ');
      final result = house.recite(6, 6);
      expect(result, equals(expected));
    }, skip: true);

    test('verse seven - the maiden all forlorn', () {
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
      final result = house.recite(7, 7);
      expect(result, equals(expected));
    }, skip: true);

    test('verse eight - the man all tattered and torn', () {
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
      final result = house.recite(8, 8);
      expect(result, equals(expected));
    }, skip: true);

    test('verse nine - the priest all shaven and shorn', () {
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
      final result = house.recite(9, 9);
      expect(result, equals(expected));
    }, skip: true);

    test('verse ten - the rooster that crowed in the morn', () {
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
      final result = house.recite(10, 10);
      expect(result, equals(expected));
    }, skip: true);

    test('verse eleven - the farmer sowing his corn', () {
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
      final result = house.recite(11, 11);
      expect(result, equals(expected));
    }, skip: true);

    test('verse 12 - the horse and the hound and the horn', () {
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
      final result = house.recite(12, 12);
      expect(result, equals(expected));
    }, skip: true);

    test('multiple verses', () {
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
      final result = house.recite(4, 8);
      expect(result, equals(expected));
    }, skip: true);

    test('full rhyme', () {
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
      final result = house.recite(1, 12);
      expect(result, equals(expected));
    }, skip: true);
  });
}
