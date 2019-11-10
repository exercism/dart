import 'package:test/test.dart';
import 'package:two_fer/two_fer.dart';

void main() {
  group('TwoFer', () {
    test('no name given', () {
      final String result = twoFer();
      expect(result, equals('One for you, one for me.'));
    }, skip: false);

    test('a name given', () {
      final String result = twoFer('Alice');
      expect(result, equals('One for Alice, one for me.'));
    }, skip: true);

    test('another name given', () {
      final String result = twoFer('Bob');
      expect(result, equals('One for Bob, one for me.'));
    }, skip: true);
  });
}
