import "package:test/test.dart";
import "package:rna_transcription/example.dart";

void main() {
  final rnaTranscription = new RnaTranscription();

  group("RnaTranscription", () {
    group("#toRna()", () {
      test("transcribes cytosine to guanine", () {
        final result = rnaTranscription.toRna("C");

        expect(result, equals("G"));
      });

      test("transcribes guanine to cytosine", () {
        final result = rnaTranscription.toRna("G");

        expect(result, equals("C"));
      }, skip: true);

      test("transcribes adenine to uracil", () {
        final result = rnaTranscription.toRna("A");

        expect(result, equals("U"));
      }, skip: true);

      test("transcribes thymine to adenine", () {
        final result = rnaTranscription.toRna("T");

        expect(result, equals("A"));
      }, skip: true);

      test("transcribes all dna nucleotides to their rna complements", () {
        final result = rnaTranscription.toRna("ACGTGGTCTTAA");

        expect(result, equals("UGCACCAGAAUU"));
      }, skip: true);

      test("correctly handles completely invalid input", () {
        expect(() => rnaTranscription.toRna("XXX"), throwsArgumentError);
      }, skip: true);

      test("correctly handles partially invalid input", () {
        expect(() => rnaTranscription.toRna("ACGTXXXCTTAA"), throwsArgumentError);
      }, skip: true);
    });
  });
}
