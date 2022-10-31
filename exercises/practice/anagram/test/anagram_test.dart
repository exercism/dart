import 'package:anagram/anagram.dart';
import 'package:test/test.dart';

final anagram = Anagram();

void main() {
  group('Anagram', () {
    test('no matches', () {
      final result = anagram.findAnagrams('diaper', <String>['hello', 'world', 'zombies', 'pants']);
      expect(result, equals(<String>[]));
    }, skip: false);

    test('detects two anagrams', () {
      final result = anagram.findAnagrams('solemn', <String>['lemons', 'cherry', 'melons']);
      expect(result, equals(<String>['lemons', 'melons']));
    }, skip: true);

    test('does not detect anagram subsets', () {
      final result = anagram.findAnagrams('good', <String>['dog', 'goody']);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('detects anagram', () {
      final result = anagram.findAnagrams('listen', <String>['enlists', 'google', 'inlets', 'banana']);
      expect(result, equals(<String>['inlets']));
    }, skip: true);

    test('detects three anagrams', () {
      final result =
          anagram.findAnagrams('allergy', <String>['gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading']);
      expect(result, equals(<String>['gallery', 'regally', 'largely']));
    }, skip: true);

    test('detects multiple anagrams with different case', () {
      final result = anagram.findAnagrams('nose', <String>['Eons', 'ONES']);
      expect(result, equals(<String>['Eons', 'ONES']));
    }, skip: true);

    test('does not detect non-anagrams with identical checksum', () {
      final result = anagram.findAnagrams('mass', <String>['last']);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('detects anagrams case-insensitively', () {
      final result = anagram.findAnagrams('Orchestra', <String>['cashregister', 'Carthorse', 'radishes']);
      expect(result, equals(<String>['Carthorse']));
    }, skip: true);

    test('detects anagrams using case-insensitive subject', () {
      final result = anagram.findAnagrams('Orchestra', <String>['cashregister', 'carthorse', 'radishes']);
      expect(result, equals(<String>['carthorse']));
    }, skip: true);

    test('detects anagrams using case-insensitive possible matches', () {
      final result = anagram.findAnagrams('orchestra', <String>['cashregister', 'Carthorse', 'radishes']);
      expect(result, equals(<String>['Carthorse']));
    }, skip: true);

    test('does not detect an anagram if the original word is repeated', () {
      final result = anagram.findAnagrams('go', <String>['go Go GO']);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('anagrams must use all letters exactly once', () {
      final result = anagram.findAnagrams('tapper', <String>['patter']);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('words are not anagrams of themselves', () {
      final result = anagram.findAnagrams('BANANA', <String>['BANANA']);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('words are not anagrams of themselves even if letter case is partially different', () {
      final result = anagram.findAnagrams('BANANA', <String>['Banana']);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('words are not anagrams of themselves even if letter case is completely different', () {
      final result = anagram.findAnagrams('BANANA', <String>['banana']);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('words other than themselves can be anagrams', () {
      final result = anagram.findAnagrams('LISTEN', <String>['LISTEN', 'Silent']);
      expect(result, equals(<String>['Silent']));
    }, skip: true);
  });
}
