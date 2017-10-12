import "package:test/test.dart";
import "package:hamming/hamming.dart";

void main() {
  final hamming = new Hamming();

  group("Hamming", () {
    test("empty strands", () {
      final res = hamming.compute("", "");

      expect(res, equals(0));
    });

    test("no difference between identical strands", () {
      final res = hamming.compute("A", "A");

      expect(res, equals(0));
    }, skip: true);

    test("non-unique character in first strand", () {
      final res = hamming.compute("AGA", "AGG");

      expect(res, equals(1));
    }, skip: true);

    test("non-unique character in second strand", () {
      final res = hamming.compute("AGG", "AGA");

      expect(res, equals(1));
    }, skip: true);

    test("same nucleotides in different positions", () {
      final res = hamming.compute("TAG", "GAT");

      expect(res, equals(2));
    }, skip: true);

    test("disallow first strand longer", () {
      expect(() => hamming.compute("AATG", "AAA"), throwsArgumentError);
    }, skip: true);

    test("disallow second strand longer", () {
      expect(() => hamming.compute("ATA", "AGTG"), throwsArgumentError);
    }, skip: true);

    test("complete hamming distance for single nucleotide strand", () {
      final res = hamming.compute("A", "G");

      expect(res, equals(1));
    }, skip: true);

    test("complete hamming distance for small strand", () {
      final res = hamming.compute("AG", "CT");

      expect(res, equals(2));
    }, skip: true);

    test("small hamming distance", () {
      final res = hamming.compute("AT", "CT");

      expect(res, equals(1));
    }, skip: true);

    test("small hamming distance in longer strand", () {
      final res = hamming.compute("GGACG", "GGTCG");

      expect(res, equals(1));
    }, skip: true);

    test("large hamming distance", () {
      final res = hamming.compute("GATACA", "GCATAA");

      expect(res, equals(4));
    }, skip: true);

    test("hamming distance in very long strand", () {
      final res = hamming.compute("GGACGGATTCTG", "AGGACGGATTCT");

      expect(res, equals(9));
    }, skip: true);

    test("throws error when strands are not equal length", () {
      expect(() => hamming.compute("GGACGGATTCTG", "AGGAC"), throwsArgumentError);
    }, skip: true);
  });
}
