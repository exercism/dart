import 'package:scrabble_score/scrabble_score.dart';
import 'package:test/test.dart';

void main() {
  group('ScrabbleScore', () {
    test('lowercase letter', () {
      final result = score('a');
      expect(result, equals(1));
    }, skip: false);

    test('uppercase letter', () {
      final result = score('A');
      expect(result, equals(1));
    }, skip: true);

    test('valuable letter', () {
      final result = score('f');
      expect(result, equals(4));
    }, skip: true);

    test('short word', () {
      final result = score('at');
      expect(result, equals(2));
    }, skip: true);

    test('short, valuable word', () {
      final result = score('zoo');
      expect(result, equals(12));
    }, skip: true);

    test('medium word', () {
      final result = score('street');
      expect(result, equals(6));
    }, skip: true);

    test('medium, valuable word', () {
      final result = score('quirky');
      expect(result, equals(22));
    }, skip: true);

    test('long, mixed-case word', () {
      final result = score('OxyphenButazone');
      expect(result, equals(41));
    }, skip: true);

    test('english-like word', () {
      final result = score('pinata');
      expect(result, equals(8));
    }, skip: true);

    test('empty input', () {
      final result = score('');
      expect(result, equals(0));
    }, skip: true);

    test('entire alphabet available', () {
      final result = score('abcdefghijklmnopqrstuvwxyz');
      expect(result, equals(87));
    }, skip: true);
  });
}
