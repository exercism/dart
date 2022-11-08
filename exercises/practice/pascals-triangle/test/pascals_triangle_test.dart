import 'package:pascals_triangle/pascals_triangle.dart';
import 'package:test/test.dart';

void main() {
  final pascalsTriangle = PascalsTriangle();

  group('PascalsTriangle', () {
    test('zero rows', () {
      final result = pascalsTriangle.rows(0);
      expect(result, equals(<List<int>>[]));
    }, skip: false);

    test('single row', () {
      final result = pascalsTriangle.rows(1);
      expect(
          result,
          equals(<List<int>>[
            <int>[1]
          ]));
    }, skip: true);

    test('two rows', () {
      final result = pascalsTriangle.rows(2);
      expect(
          result,
          equals(<List<int>>[
            <int>[1],
            <int>[1, 1]
          ]));
    }, skip: true);

    test('three rows', () {
      final result = pascalsTriangle.rows(3);
      expect(
          result,
          equals(<List<int>>[
            <int>[1],
            <int>[1, 1],
            <int>[1, 2, 1]
          ]));
    }, skip: true);

    test('four rows', () {
      final result = pascalsTriangle.rows(4);
      expect(
          result,
          equals(<List<int>>[
            <int>[1],
            <int>[1, 1],
            <int>[1, 2, 1],
            <int>[1, 3, 3, 1]
          ]));
    }, skip: true);

    test('five rows', () {
      final result = pascalsTriangle.rows(5);
      expect(
          result,
          equals(<List<int>>[
            <int>[1],
            <int>[1, 1],
            <int>[1, 2, 1],
            <int>[1, 3, 3, 1],
            <int>[1, 4, 6, 4, 1]
          ]));
    }, skip: true);

    test('six rows', () {
      final result = pascalsTriangle.rows(6);
      expect(
          result,
          equals(<List<int>>[
            <int>[1],
            <int>[1, 1],
            <int>[1, 2, 1],
            <int>[1, 3, 3, 1],
            <int>[1, 4, 6, 4, 1],
            <int>[1, 5, 10, 10, 5, 1]
          ]));
    }, skip: true);

    test('ten rows', () {
      final result = pascalsTriangle.rows(10);
      expect(
          result,
          equals(<List<int>>[
            <int>[1],
            <int>[1, 1],
            <int>[1, 2, 1],
            <int>[1, 3, 3, 1],
            <int>[1, 4, 6, 4, 1],
            <int>[1, 5, 10, 10, 5, 1],
            <int>[1, 6, 15, 20, 15, 6, 1],
            <int>[1, 7, 21, 35, 35, 21, 7, 1],
            <int>[1, 8, 28, 56, 70, 56, 28, 8, 1],
            <int>[1, 9, 36, 84, 126, 126, 84, 36, 9, 1]
          ]));
    }, skip: true);
  });
}
