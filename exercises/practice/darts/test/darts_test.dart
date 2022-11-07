import 'package:darts/darts.dart';
import 'package:test/test.dart';

void main() {
  final darts = Darts();

  group('Darts', () {
    test('Missed target', () {
      final result = darts.score(-9, 9);
      expect(result, equals(0));
    }, skip: false);

    test('On the outer circle', () {
      final result = darts.score(0, 10);
      expect(result, equals(1));
    }, skip: true);

    test('On the middle circle', () {
      final result = darts.score(-5, 0);
      expect(result, equals(5));
    }, skip: true);

    test('On the inner circle', () {
      final result = darts.score(0, -1);
      expect(result, equals(10));
    }, skip: true);

    test('Exactly on centre', () {
      final result = darts.score(0, 0);
      expect(result, equals(10));
    }, skip: true);

    test('Near the centre', () {
      final result = darts.score(-0.1, -0.1);
      expect(result, equals(10));
    }, skip: true);

    test('Just within the inner circle', () {
      final result = darts.score(0.7, 0.7);
      expect(result, equals(10));
    }, skip: true);

    test('Just outside the inner circle', () {
      final result = darts.score(0.8, -0.8);
      expect(result, equals(5));
    }, skip: true);

    test('Just within the middle circle', () {
      final result = darts.score(-3.5, 3.5);
      expect(result, equals(5));
    }, skip: true);

    test('Just outside the middle circle', () {
      final result = darts.score(-3.6, -3.6);
      expect(result, equals(1));
    }, skip: true);

    test('Just within the outer circle', () {
      final result = darts.score(-7.0, 7.0);
      expect(result, equals(1));
    }, skip: true);

    test('Just outside the outer circle', () {
      final result = darts.score(7.1, -7.1);
      expect(result, equals(0));
    }, skip: true);

    test('Asymmetric position between the inner and middle circles', () {
      final result = darts.score(0.5, -4);
      expect(result, equals(5));
    }, skip: true);
  });
}
