import "package:test/test.dart";
import "package:hamming/hamming.dart";

/// Test cases match one-to-one with those described
/// in the problem specification found here:
/// https://github.com/exercism/problem-specifications/blob/master/exercises/hamming/canonical-data.json
void main() {
  final hamming = new Hamming();

  group("Hamming", () {
    test("empty strands", () {
      expect(hamming.compute("", ""), equals(0));
    });

    test("identical strands", () {
      expect(hamming.compute("A", "A"), equals(0));
    }, skip: true);

    test("long identical strands", () {
      expect(hamming.compute("GGACTGA", "GGACTGA"), equals(0));
    }, skip: true);

    test("complete distance in single nucleotide strands", () {
      expect(hamming.compute("A", "G"), equals(1));
    }, skip: true);

    test("complete distance in small strands", () {
      expect(hamming.compute("AG", "CT"), equals(2));
    }, skip: true);

    test("small distance in small strands", () {
      expect(hamming.compute("AT", "CT"), equals(1));
    }, skip: true);

    test("small distance", () {
      expect(hamming.compute("GGACG", "GGTCG"), equals(1));
    }, skip: true);

    test("small distance in long strands", () {
      expect(hamming.compute("ACCAGGG", "ACTATGG"), equals(2));
    }, skip: true);

    test("non-unique character in first strand", () {
      expect(hamming.compute("AGA", "AGG"), equals(1));
    }, skip: true);

    test("non-unique character in second strand", () {
      expect(hamming.compute("AGG", "AGA"), equals(1));
    }, skip: true);

    test("same nucleotides in different positions", () {
      expect(hamming.compute("TAG", "GAT"), equals(2));
    }, skip: true);

    test("large distance", () {
      expect(hamming.compute("GATACA", "GCATAA"), equals(4));
    }, skip: true);

    test("large distance in off-by-one strand", () {
      expect(hamming.compute("GGACGGATTCTG", "AGGACGGATTCT"), equals(9));
    }, skip: true);

    test("disallow first strand longer", () {
      expect(() => hamming.compute("AATG", "AAA"), throwsArgumentError);
    }, skip: true);

    test("disallow second strand longer", () {
      expect(() => hamming.compute("ATA", "AGTG"), throwsArgumentError);
    }, skip: true);
  });
}