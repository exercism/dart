import 'package:hamming/hamming.dart';
import 'package:test/test.dart';

final hamming = Hamming();

/// Test cases match one-to-one with those described
/// in the problem specification found here:
/// https://github.com/exercism/problem-specifications/blob/master/exercises/hamming/canonical-data.json
void main() {
  final mustEqual = predicate(
      (Error e) => e is ArgumentError && e.message == 'left and right strands must be of equal length',
      'an ArgumentError with the message "left and right strands must be of equal length"');
  final noEmptyStrand = predicate((Error e) => e is ArgumentError && e.message == 'no strand must be empty',
      'an ArgumentError with the message "no strand must be empty"');

  group('Hamming', () {
    test('empty strands', () {
      final int result = hamming.distance('', '');
      expect(result, equals(0));
    }, skip: false);

    test('single letter identical strands', () {
      final int result = hamming.distance('A', 'A');
      expect(result, equals(0));
    }, skip: true);

    test('single letter different strands', () {
      final int result = hamming.distance('G', 'T');
      expect(result, equals(1));
    }, skip: true);

    test('long identical strands', () {
      final int result = hamming.distance('GGACTGAAATCTG', 'GGACTGAAATCTG');
      expect(result, equals(0));
    }, skip: true);

    test('long different strands', () {
      final int result = hamming.distance('GGACGGATTCTG', 'AGGACGGATTCT');
      expect(result, equals(9));
    }, skip: true);

    test('disallow first strand longer', () {
      expect(() => hamming.distance('AATG', 'AAA'), throwsA(mustEqual));
    }, skip: true);

    test('disallow second strand longer', () {
      expect(() => hamming.distance('ATA', 'AGTG'), throwsA(mustEqual));
    }, skip: true);

    test('disallow left empty strand', () {
      expect(() => hamming.distance('', 'G'), throwsA(noEmptyStrand));
    }, skip: true);

    test('disallow right empty strand', () {
      expect(() => hamming.distance('G', ''), throwsA(noEmptyStrand));
    }, skip: true);
  });
}
