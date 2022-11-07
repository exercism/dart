import 'package:bob/bob.dart';
import 'package:test/test.dart';

void main() {
  final bob = Bob();

  group('Bob', () {
    test('stating something', () {
      final result = bob.response('Tom-ay-to, tom-aaaah-to.');
      expect(result, equals('Whatever.'));
    }, skip: false);

    test('shouting', () {
      final result = bob.response('WATCH OUT!');
      expect(result, equals('Whoa, chill out!'));
    }, skip: true);

    test('shouting gibberish', () {
      final result = bob.response('FCECDFCAAB');
      expect(result, equals('Whoa, chill out!'));
    }, skip: true);

    test('asking a question', () {
      final result = bob.response('Does this cryogenic chamber make me look fat?');
      expect(result, equals('Sure.'));
    }, skip: true);

    test('asking a numeric question', () {
      final result = bob.response('You are, what, like 15?');
      expect(result, equals('Sure.'));
    }, skip: true);

    test('asking gibberish', () {
      final result = bob.response('fffbbcbeab?');
      expect(result, equals('Sure.'));
    }, skip: true);

    test('talking forcefully', () {
      final result = bob.response('Hi there!');
      expect(result, equals('Whatever.'));
    }, skip: true);

    test('using acronyms in regular speech', () {
      final result = bob.response('It\'s OK if you don\'t want to go work for NASA.');
      expect(result, equals('Whatever.'));
    }, skip: true);

    test('forceful question', () {
      final result = bob.response('WHAT\'S GOING ON?');
      expect(result, equals('Calm down, I know what I\'m doing!'));
    }, skip: true);

    test('shouting numbers', () {
      final result = bob.response('1, 2, 3 GO!');
      expect(result, equals('Whoa, chill out!'));
    }, skip: true);

    test('no letters', () {
      final result = bob.response('1, 2, 3');
      expect(result, equals('Whatever.'));
    }, skip: true);

    test('question with no letters', () {
      final result = bob.response('4?');
      expect(result, equals('Sure.'));
    }, skip: true);

    test('shouting with special characters', () {
      final result = bob.response('ZOMG THE %^*@#\$(*^ ZOMBIES ARE COMING!!11!!1!');
      expect(result, equals('Whoa, chill out!'));
    }, skip: true);

    test('shouting with no exclamation mark', () {
      final result = bob.response('I HATE THE DENTIST');
      expect(result, equals('Whoa, chill out!'));
    }, skip: true);

    test('statement containing question mark', () {
      final result = bob.response('Ending with ? means a question.');
      expect(result, equals('Whatever.'));
    }, skip: true);

    test('non-letters with question', () {
      final result = bob.response(':) ?');
      expect(result, equals('Sure.'));
    }, skip: true);

    test('prattling on', () {
      final result = bob.response('Wait! Hang on. Are you going to be OK?');
      expect(result, equals('Sure.'));
    }, skip: true);

    test('silence', () {
      final result = bob.response('');
      expect(result, equals('Fine. Be that way!'));
    }, skip: true);

    test('prolonged silence', () {
      final result = bob.response('          ');
      expect(result, equals('Fine. Be that way!'));
    }, skip: true);

    test('alternate silence', () {
      final result = bob.response('\t\t\t\t\t\t\t\t\t\t');
      expect(result, equals('Fine. Be that way!'));
    }, skip: true);

    test('multiple line question', () {
      final result = bob.response('\nDoes this cryogenic chamber make me look fat?\nNo.');
      expect(result, equals('Whatever.'));
    }, skip: true);

    test('starting with whitespace', () {
      final result = bob.response('         hmmmmmmm...');
      expect(result, equals('Whatever.'));
    }, skip: true);

    test('ending with whitespace', () {
      final result = bob.response('Okay if like my  spacebar  quite a bit?   ');
      expect(result, equals('Sure.'));
    }, skip: true);

    test('other whitespace', () {
      final result = bob.response('\n\r \t');
      expect(result, equals('Fine. Be that way!'));
    }, skip: true);

    test('non-question ending with whitespace', () {
      final result = bob.response('This is a statement ending with whitespace      ');
      expect(result, equals('Whatever.'));
    }, skip: true);
  });
}
