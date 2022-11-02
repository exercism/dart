import 'package:pangram/pangram.dart';
import 'package:test/test.dart';

void main() {
  final pangram = Pangram();

  group('Pangram', () {
    test('empty sentence', () {
      final result = pangram.isPangram('');
      expect(result, equals(false));
    }, skip: false);

    test('perfect lower case', () {
      final result = pangram.isPangram('abcdefghijklmnopqrstuvwxyz');
      expect(result, equals(true));
    }, skip: true);

    test('only lower case', () {
      final result = pangram.isPangram('the quick brown fox jumps over the lazy dog');
      expect(result, equals(true));
    }, skip: true);

    test('missing the letter \'x\'', () {
      final result = pangram.isPangram('a quick movement of the enemy will jeopardize five gunboats');
      expect(result, equals(false));
    }, skip: true);

    test('missing the letter \'h\'', () {
      final result = pangram.isPangram('five boxing wizards jump quickly at it');
      expect(result, equals(false));
    }, skip: true);

    test('with underscores', () {
      final result = pangram.isPangram('the_quick_brown_fox_jumps_over_the_lazy_dog');
      expect(result, equals(true));
    }, skip: true);

    test('with numbers', () {
      final result = pangram.isPangram('the 1 quick brown fox jumps over the 2 lazy dogs');
      expect(result, equals(true));
    }, skip: true);

    test('missing letters replaced by numbers', () {
      final result = pangram.isPangram('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog');
      expect(result, equals(false));
    }, skip: true);

    test('mixed case and punctuation', () {
      final result = pangram.isPangram('"Five quacking Zephyrs jolt my wax bed."');
      expect(result, equals(true));
    }, skip: true);

    test('a-m and A-M are 26 different characters but not a pangram', () {
      final result = pangram.isPangram('abcdefghijklm ABCDEFGHIJKLM');
      expect(result, equals(false));
    }, skip: true);
  });
}
