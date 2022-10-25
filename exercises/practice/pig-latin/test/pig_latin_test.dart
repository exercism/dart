import 'package:pig_latin/pig_latin.dart' as pigLatin;
import 'package:test/test.dart';

void main() {
  group('PigLatin', () {
    group('ay is added to words that start with vowels', () {
      test('word beginning with a', () {
        final result = pigLatin.translate('apple');
        expect(result, equals('appleay'));
      }, skip: false);

      test('word beginning with e', () {
        final result = pigLatin.translate('ear');
        expect(result, equals('earay'));
      }, skip: true);

      test('word beginning with i', () {
        final result = pigLatin.translate('igloo');
        expect(result, equals('iglooay'));
      }, skip: true);

      test('word beginning with o', () {
        final result = pigLatin.translate('object');
        expect(result, equals('objectay'));
      }, skip: true);

      test('word beginning with u', () {
        final result = pigLatin.translate('under');
        expect(result, equals('underay'));
      }, skip: true);

      test('word beginning with a vowel and followed by a qu', () {
        final result = pigLatin.translate('equal');
        expect(result, equals('equalay'));
      }, skip: true);
    });

    group('first letter and ay are moved to the end of words that start with consonants', () {
      test('word beginning with p', () {
        final result = pigLatin.translate('pig');
        expect(result, equals('igpay'));
      }, skip: true);

      test('word beginning with k', () {
        final result = pigLatin.translate('koala');
        expect(result, equals('oalakay'));
      }, skip: true);

      test('word beginning with x', () {
        final result = pigLatin.translate('xenon');
        expect(result, equals('enonxay'));
      }, skip: true);

      test('word beginning with q without a following u', () {
        final result = pigLatin.translate('qat');
        expect(result, equals('atqay'));
      }, skip: true);
    });

    group('some letter clusters are treated like a single consonant', () {
      test('word beginning with ch', () {
        final result = pigLatin.translate('chair');
        expect(result, equals('airchay'));
      }, skip: true);

      test('word beginning with qu', () {
        final result = pigLatin.translate('queen');
        expect(result, equals('eenquay'));
      }, skip: true);

      test('word beginning with qu and a preceding consonant', () {
        final result = pigLatin.translate('square');
        expect(result, equals('aresquay'));
      }, skip: true);

      test('word beginning with th', () {
        final result = pigLatin.translate('therapy');
        expect(result, equals('erapythay'));
      }, skip: true);

      test('word beginning with thr', () {
        final result = pigLatin.translate('thrush');
        expect(result, equals('ushthray'));
      }, skip: true);

      test('word beginning with sch', () {
        final result = pigLatin.translate('school');
        expect(result, equals('oolschay'));
      }, skip: true);
    });

    group('some letter clusters are treated like a single vowel', () {
      test('word beginning with yt', () {
        final result = pigLatin.translate('yttria');
        expect(result, equals('yttriaay'));
      }, skip: true);

      test('word beginning with xr', () {
        final result = pigLatin.translate('xray');
        expect(result, equals('xrayay'));
      }, skip: true);
    });

    group('position of y in a word determines if it is a consonant or a vowel', () {
      test('y is treated like a consonant at the beginning of a word', () {
        final result = pigLatin.translate('yellow');
        expect(result, equals('ellowyay'));
      }, skip: true);

      test('y is treated like a vowel at the end of a consonant cluster', () {
        final result = pigLatin.translate('rhythm');
        expect(result, equals('ythmrhay'));
      }, skip: true);

      test('y as second letter in two letter word', () {
        final result = pigLatin.translate('my');
        expect(result, equals('ymay'));
      }, skip: true);
    });

    group('phrases are translated', () {
      test('a whole phrase', () {
        final result = pigLatin.translate('quick fast run');
        expect(result, equals('ickquay astfay unray'));
      }, skip: true);
    });
  });
}
