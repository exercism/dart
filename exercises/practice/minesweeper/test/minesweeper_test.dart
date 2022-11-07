import 'package:minesweeper/minesweeper.dart';
import 'package:test/test.dart';

void main() {
  group('Minesweeper', () {
    test('no rows', () {
      final result = Minesweeper(<String>[]).annotated;
      expect(result, equals(<String>[]));
    }, skip: false);

    test('no columns', () {
      final result = Minesweeper(<String>['']).annotated;
      expect(result, equals(<String>['']));
    }, skip: true);

    test('no mines', () {
      final result = Minesweeper(<String>['   ', '   ', '   ']).annotated;
      expect(result, equals(<String>['   ', '   ', '   ']));
    }, skip: true);

    test('minefield with only mines', () {
      final result = Minesweeper(<String>['***', '***', '***']).annotated;
      expect(result, equals(<String>['***', '***', '***']));
    }, skip: true);

    test('mine surrounded by spaces', () {
      final result = Minesweeper(<String>['   ', ' * ', '   ']).annotated;
      expect(result, equals(<String>['111', '1*1', '111']));
    }, skip: true);

    test('space surrounded by mines', () {
      final result = Minesweeper(<String>['***', '* *', '***']).annotated;
      expect(result, equals(<String>['***', '*8*', '***']));
    }, skip: true);

    test('horizontal line', () {
      final result = Minesweeper(<String>[' * * ']).annotated;
      expect(result, equals(<String>['1*2*1']));
    }, skip: true);

    test('horizontal line, mines at edges', () {
      final result = Minesweeper(<String>['*   *']).annotated;
      expect(result, equals(<String>['*1 1*']));
    }, skip: true);

    test('vertical line', () {
      final result = Minesweeper(<String>[' ', '*', ' ', '*', ' ']).annotated;
      expect(result, equals(<String>['1', '*', '2', '*', '1']));
    }, skip: true);

    test('vertical line, mines at edges', () {
      final result = Minesweeper(<String>['*', ' ', ' ', ' ', '*']).annotated;
      expect(result, equals(<String>['*', '1', ' ', '1', '*']));
    }, skip: true);

    test('cross', () {
      final result = Minesweeper(<String>['  *  ', '  *  ', '*****', '  *  ', '  *  ']).annotated;
      expect(result, equals(<String>[' 2*2 ', '25*52', '*****', '25*52', ' 2*2 ']));
    }, skip: true);

    test('large minefield', () {
      final result = Minesweeper(<String>[' *  * ', '  *   ', '    * ', '   * *', ' *  * ', '      ']).annotated;
      expect(result, equals(<String>['1*22*1', '12*322', ' 123*2', '112*4*', '1*22*2', '111111']));
    }, skip: true);
  });
}
