import 'package:nucleotide_count/nucleotide_count.dart';
import 'package:test/test.dart';

void main() {
  final counter = NucleotideCount();

  group('NucleotideCount', () {
    test('Empty strand', () {
      final strand = "";
      final result = counter.count(strand);
      final expected = {"A": 0, "C": 0, "G": 0, "T": 0};
      expect(result, equals(expected));
    }, skip: false);

    test('Can count one nucleotide in single-character input', () {
      final strand = "G";
      final result = counter.count(strand);
      final expected = {"A": 0, "C": 0, "G": 1, "T": 0};
      expect(result, equals(expected));
    }, skip: true);

    test('Strand with repeated nucleotide', () {
      final strand = "GGGGGGG";
      final result = counter.count(strand);
      final expected = {"A": 0, "C": 0, "G": 7, "T": 0};
      expect(result, equals(expected));
    }, skip: true);

    test('Strand with multiple nucleotides', () {
      final strand = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC";
      final result = counter.count(strand);
      final expected = {"A": 20, "C": 12, "G": 17, "T": 21};
      expect(result, equals(expected));
    }, skip: true);

    test('Handles invalid nucleotides', () {
      final strand = "AGXXACT";
      expect(() => counter.count(strand), throwsA(const TypeMatcher<InvalidNucleotideException>()));
    }, skip: true);
  });
}
