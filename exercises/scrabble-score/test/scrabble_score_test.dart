import 'package:scrabble_score/scrabble_score.dart';
import 'package:test/test.dart';

void main() {
  group('Scrabble score', () {
    test('lowercase letter', () {
      final num result = score('a');
      expect(result, equals(1));
    }, skip: false);

    test('uppercase letter', () {
      final num result = score('A');
      expect(result, equals(1));
    }, skip: true);

    test('valuable letter', () {
      final num result = score('f');
      expect(result, equals(4));
    }, skip: true);

    test('short word', () {
      final num result = score('at');
      expect(result, equals(2));
    }, skip: true);

    test('short, valuable word', () {
      final num result = score('zoo');
      expect(result, equals(12));
    }, skip: true);

    test('medium word', () {
      final num result = score('street');
      expect(result, equals(6));
    }, skip: true);

    test('medium, valuable word', () {
      final num result = score('quirky');
      expect(result, equals(22));
    }, skip: true);

    test('long, mixed-case word', () {
      final num result = score('OxyphenButazone');
      expect(result, equals(41));
    }, skip: true);

    test('english-like word', () {
      final num result = score('pinata');
      expect(result, equals(8));
    }, skip: true);

    test('empty input', () {
      final num result = score('');
      expect(result, equals(0));
    }, skip: true);

    test('entire alphabet available', () {
      final num result = score('abcdefghijklmnopqrstuvwxyz');
      expect(result, equals(87));
    }, skip: true);
  });
}
