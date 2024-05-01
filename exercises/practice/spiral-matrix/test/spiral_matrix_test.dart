import 'package:spiral_matrix/spiral_matrix.dart';
import 'package:test/test.dart';

void main() {
  test('empty spiral', () {
    final result = SpiralMatrix(0).toList();
    final expected = [];
    expect(result, expected);
  }, skip: false);

  test('trivial spiral', () {
    final result = SpiralMatrix(1).toList();
    final expected = [
      [1]
    ];
    expect(result, expected);
  }, skip: true);

  test('spiral of size 2', () {
    final result = SpiralMatrix(2).toList();
    final expected = [
      [1, 2],
      [4, 3]
    ];
    expect(result, expected);
  }, skip: true);

  test('spiral of size 3', () {
    final result = SpiralMatrix(3).toList();
    final expected = [
      [1, 2, 3],
      [8, 9, 4],
      [7, 6, 5]
    ];
    expect(result, expected);
  }, skip: true);

  test('spiral of size 4', () {
    final result = SpiralMatrix(4).toList();
    final expected = [
      [1, 2, 3, 4],
      [12, 13, 14, 5],
      [11, 16, 15, 6],
      [10, 9, 8, 7]
    ];
    expect(result, expected);
  }, skip: true);

  test("spiral of size 5", () {
    final result = SpiralMatrix(5).toList();
    final expected = [
      [1, 2, 3, 4, 5],
      [16, 17, 18, 19, 6],
      [15, 24, 25, 20, 7],
      [14, 23, 22, 21, 8],
      [13, 12, 11, 10, 9]
    ];
    expect(result, expected);
  }, skip: true);
}
