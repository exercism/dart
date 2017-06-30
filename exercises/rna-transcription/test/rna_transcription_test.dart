import "package:test/test.dart";
import "package:rna_transcription/rna_transcription.dart";

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
      }, skip: false);

      test("transcribes adenine to uracil", () {
        final result = rnaTranscription.toRna("A");

        expect(result, equals("U"));
      }, skip: false);

      test("transcribes thymine to adenine", () {
        final result = rnaTranscription.toRna("T");

        expect(result, equals("A"));
      }, skip: false);

      test("transcribes all dna nucleotides to their rna complements", () {
        final result = rnaTranscription.toRna("ACGTGGTCTTAA");

        expect(result, equals("UGCACCAGAAUU"));
      }, skip: false);

      test("correctly handles completely invalid input", () {
        expect(() => rnaTranscription.toRna("XXX"), throwsArgumentError);
      }, skip: false);

      test("correctly handles partially invalid input", () {
        expect(() => rnaTranscription.toRna("ACGTXXXCTTAA"), throwsArgumentError);
      }, skip: false);
    });
  });
}
