import 'package:square_root/square_root.dart';
import 'package:test/test.dart';

void main() {
  final squareRoot = SquareRoot();

  group('SquareRoot', () {
    test('root of 1', () {
      final result = squareRoot.squareRoot(1);
      expect(result, equals(1));
    }, skip: false);

    test('root of 4', () {
      final result = squareRoot.squareRoot(4);
      expect(result, equals(2));
    }, skip: true);

    test('root of 25', () {
      final result = squareRoot.squareRoot(25);
      expect(result, equals(5));
    }, skip: true);

    test('root of 81', () {
      final result = squareRoot.squareRoot(81);
      expect(result, equals(9));
    }, skip: true);

    test('root of 196', () {
      final result = squareRoot.squareRoot(196);
      expect(result, equals(14));
    }, skip: true);

    test('root of 65025', () {
      final result = squareRoot.squareRoot(65025);
      expect(result, equals(255));
    }, skip: true);
  });
}
