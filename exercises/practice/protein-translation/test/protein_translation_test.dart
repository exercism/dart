import 'package:protein_translation/protein_translation.dart';
import 'package:test/test.dart';

void main() {
  final translator = ProteinTranslation();

  test('Empty RNA sequence results in no proteins', () {
    final result = translator.translate("");
    expect(result, equals([]));
  }, skip: false);

  test('Methionine RNA sequence', () {
    final result = translator.translate("AUG");
    expect(result, equals(["Methionine"]));
  }, skip: true);

  test('Phenylalanine RNA sequence 1', () {
    final result = translator.translate("UUU");
    expect(result, equals(["Phenylalanine"]));
  }, skip: true);

  test('Phenylalanine RNA sequence 2', () {
    final result = translator.translate("UUC");
    expect(result, equals(["Phenylalanine"]));
  }, skip: true);

  test('Leucine RNA sequence 1', () {
    final result = translator.translate("UUA");
    expect(result, equals(["Leucine"]));
  }, skip: true);

  test('Leucine RNA sequence 2', () {
    final result = translator.translate("UUG");
    expect(result, equals(["Leucine"]));
  }, skip: true);

  test('Serine RNA sequence 1', () {
    final result = translator.translate("UCU");
    expect(result, equals(["Serine"]));
  }, skip: true);

  test('Serine RNA sequence 2', () {
    final result = translator.translate("UCC");
    expect(result, equals(["Serine"]));
  }, skip: true);

  test('Serine RNA sequence 3', () {
    final result = translator.translate("UCA");
    expect(result, equals(["Serine"]));
  }, skip: true);

  test('Serine RNA sequence 4', () {
    final result = translator.translate("UCG");
    expect(result, equals(["Serine"]));
  }, skip: true);

  test('Tyrosine RNA sequence 1', () {
    final result = translator.translate("UAU");
    expect(result, equals(["Tyrosine"]));
  }, skip: true);

  test('Tyrosine RNA sequence 2', () {
    final result = translator.translate("UAC");
    expect(result, equals(["Tyrosine"]));
  }, skip: true);

  test('Cysteine RNA sequence 1', () {
    final result = translator.translate("UGU");
    expect(result, equals(["Cysteine"]));
  }, skip: true);

  test('Cysteine RNA sequence 2', () {
    final result = translator.translate("UGC");
    expect(result, equals(["Cysteine"]));
  }, skip: true);

  test('Tryptophan RNA sequence', () {
    final result = translator.translate("UGG");
    expect(result, equals(["Tryptophan"]));
  }, skip: true);

  test('STOP codon RNA sequence 1', () {
    final result = translator.translate("UAA");
    expect(result, equals([]));
  }, skip: true);

  test('STOP codon RNA sequence 2', () {
    final result = translator.translate("UAG");
    expect(result, equals([]));
  }, skip: true);

  test('STOP codon RNA sequence 3', () {
    final result = translator.translate("UGA");
    expect(result, equals([]));
  }, skip: true);

  test('Sequence of two protein codons translates into proteins', () {
    final result = translator.translate("UUUUUU");
    expect(result, equals(["Phenylalanine", "Phenylalanine"]));
  }, skip: true);

  test('Sequence of two different protein codons translates into proteins', () {
    final result = translator.translate("UUAUUG");
    expect(result, equals(["Leucine", "Leucine"]));
  }, skip: true);

  test('Translate RNA strand into correct protein list', () {
    final result = translator.translate("AUGUUUUGG");
    expect(result, equals(["Methionine", "Phenylalanine", "Tryptophan"]));
  }, skip: true);

  test('Translation stops if STOP codon at beginning of sequence', () {
    final result = translator.translate("UAGUGG");
    expect(result, equals([]));
  }, skip: true);

  test('Translation stops if STOP codon at end of two-codon sequence', () {
    final result = translator.translate("UGGUAG");
    expect(result, equals(["Tryptophan"]));
  }, skip: true);

  test('Translation stops if STOP codon at end of three-codon sequence', () {
    final result = translator.translate("AUGUUUUAA");
    expect(result, equals(["Methionine", "Phenylalanine"]));
  }, skip: true);

  test('Translation stops if STOP codon in middle of three-codon sequence', () {
    final result = translator.translate("UGGUAGUGG");
    expect(result, equals(["Tryptophan"]));
  }, skip: true);

  test('Translation stops if STOP codon in middle of six-codon sequence', () {
    final result = translator.translate("UGGUGUUAUUAAUGGUUU");
    expect(result, equals(["Tryptophan", "Cysteine", "Tyrosine"]));
  }, skip: true);

  test('Sequence of two non-STOP codons does not translate to a STOP codon', () {
    final result = translator.translate("AUGAUG");
    expect(result, equals(["Methionine", "Methionine"]));
  }, skip: true);

  test("Non-existing codon can't translate", () {
    expect(() => translator.translate("AAA"), throwsA(isA<ArgumentError>()));
  }, skip: true);

  test("Unknown amino acids, not part of a codon, can't translate", () {
    expect(() => translator.translate("XYZ"), throwsA(isA<ArgumentError>()));
  }, skip: true);

  test("Incomplete RNA sequence can't translate", () {
    expect(() => translator.translate("AUGU"), throwsA(isA<ArgumentError>()));
  }, skip: true);

  test('Incomplete RNA sequence can translate if valid until a STOP codon', () {
    final result = translator.translate("UUCUUCUAAUGGU");
    expect(result, equals(["Phenylalanine", "Phenylalanine"]));
  }, skip: true);
}
