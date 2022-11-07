import 'package:secret_handshake/secret_handshake.dart';
import 'package:test/test.dart';

void main() {
  final secretHandshake = SecretHandshake();

  group('SecretHandshake', () {
    test('wink for 1', () {
      final result = secretHandshake.commands(1);
      expect(result, equals(<String>['wink']));
    }, skip: false);

    test('double blink for 10', () {
      final result = secretHandshake.commands(2);
      expect(result, equals(<String>['double blink']));
    }, skip: true);

    test('close your eyes for 100', () {
      final result = secretHandshake.commands(4);
      expect(result, equals(<String>['close your eyes']));
    }, skip: true);

    test('jump for 1000', () {
      final result = secretHandshake.commands(8);
      expect(result, equals(<String>['jump']));
    }, skip: true);

    test('combine two actions', () {
      final result = secretHandshake.commands(3);
      expect(result, equals(<String>['wink', 'double blink']));
    }, skip: true);

    test('reverse two actions', () {
      final result = secretHandshake.commands(19);
      expect(result, equals(<String>['double blink', 'wink']));
    }, skip: true);

    test('reversing one action gives the same action', () {
      final result = secretHandshake.commands(24);
      expect(result, equals(<String>['jump']));
    }, skip: true);

    test('reversing no actions still gives no actions', () {
      final result = secretHandshake.commands(16);
      expect(result, equals(<String>[]));
    }, skip: true);

    test('all possible actions', () {
      final result = secretHandshake.commands(15);
      expect(result, equals(<String>['wink', 'double blink', 'close your eyes', 'jump']));
    }, skip: true);

    test('reverse all possible actions', () {
      final result = secretHandshake.commands(31);
      expect(result, equals(<String>['jump', 'close your eyes', 'double blink', 'wink']));
    }, skip: true);

    test('do nothing for zero', () {
      final result = secretHandshake.commands(0);
      expect(result, equals(<String>[]));
    }, skip: true);
  });
}
