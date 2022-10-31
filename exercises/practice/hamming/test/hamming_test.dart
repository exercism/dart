import 'package:hamming/hamming.dart';
import 'package:test/test.dart';

void main() {
  final hamming = Hamming();

  final mustEqual = predicate((Error e) => e is ArgumentError && e.message == 'strands must be of equal length',
      'an ArgumentError with the message "strands must be of equal length"');

  group('Hamming', () {
    test('empty strands', () {
      final result = hamming.distance('', '');
      expect(result, equals(0));
    }, skip: false);

    test('single letter identical strands', () {
      final result = hamming.distance('A', 'A');
      expect(result, equals(0));
    }, skip: true);

    test('single letter different strands', () {
      final result = hamming.distance('G', 'T');
      expect(result, equals(1));
    }, skip: true);

    test('long identical strands', () {
      final result = hamming.distance('GGACTGAAATCTG', 'GGACTGAAATCTG');
      expect(result, equals(0));
    }, skip: true);

    test('long different strands', () {
      final result = hamming.distance('GGACGGATTCTG', 'AGGACGGATTCT');
      expect(result, equals(9));
    }, skip: true);

    test('disallow first strand longer', () {
      expect(() => hamming.distance('AATG', 'AAA'), throwsA(mustEqual));
    }, skip: true);

    test('disallow second strand longer', () {
      expect(() => hamming.distance('ATA', 'AGTG'), throwsA(mustEqual));
    }, skip: true);

    test('disallow empty first strand', () {
      expect(() => hamming.distance('', 'G'), throwsA(mustEqual));
    }, skip: true);

    test('disallow empty second strand', () {
      expect(() => hamming.distance('G', ''), throwsA(mustEqual));
    }, skip: true);
  });
}
