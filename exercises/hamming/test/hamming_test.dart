import 'package:test/test.dart';
import 'package:hamming/hamming.dart';

/// Test cases match one-to-one with those described
/// in the problem specification found here:
/// https://github.com/exercism/problem-specifications/blob/master/exercises/hamming/canonical-data.json
void main() {
  final Hamming hamming = new Hamming();

  group('Hamming', () {
    test("empty strands", () {
      final int result = hamming.distance("", "");
      expect(result, equals(0));
    }, skip: false);

    test("identical strands", () {
      final int result = hamming.distance("A", "A");
      expect(result, equals(0));
    }, skip: true);

    test("long identical strands", () {
      final int result = hamming.distance("GGACTGA", "GGACTGA");
      expect(result, equals(0));
    }, skip: true);

    test("complete distance in single nucleotide strands", () {
      final int result = hamming.distance("A", "G");
      expect(result, equals(1));
    }, skip: true);

    test("complete distance in small strands", () {
      final int result = hamming.distance("AG", "CT");
      expect(result, equals(2));
    }, skip: true);

    test("small distance in small strands", () {
      final int result = hamming.distance("AT", "CT");
      expect(result, equals(1));
    }, skip: true);

    test("small distance", () {
      final int result = hamming.distance("GGACG", "GGTCG");
      expect(result, equals(1));
    }, skip: true);

    test("small distance in long strands", () {
      final int result = hamming.distance("ACCAGGG", "ACTATGG");
      expect(result, equals(2));
    }, skip: true);

    test("non-unique character in first strand", () {
      final int result = hamming.distance("AAG", "AAA");
      expect(result, equals(1));
    }, skip: true);

    test("non-unique character in second strand", () {
      final int result = hamming.distance("AAA", "AAG");
      expect(result, equals(1));
    }, skip: true);

    test("same nucleotides in different positions", () {
      final int result = hamming.distance("TAG", "GAT");
      expect(result, equals(2));
    }, skip: true);

    test("large distance", () {
      final int result = hamming.distance("GATACA", "GCATAA");
      expect(result, equals(4));
    }, skip: true);

    test("large distance in off-by-one strand", () {
      final int result = hamming.distance("GGACGGATTCTG", "AGGACGGATTCT");
      expect(result, equals(9));
    }, skip: true);

    test("disallow first strand longer", () {
      expect(() => hamming.distance("AATG", "AAA"), throwsArgumentError);
    }, skip: true);

    test("disallow second strand longer", () {
      expect(() => hamming.distance("ATA", "AGTG"), throwsArgumentError);
    }, skip: true);
  });
}
