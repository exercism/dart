import 'package:game_of_life/game_of_life.dart';
import 'package:test/test.dart';

void main() {
  group('Game of Life', () {
    test('empty matrix', () {
      final List<List<int>> matrix = [];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [];
      expect(game.matrix(), expected);
    }, skip: false);

    test('live cells with zero live neighbors die', () {
      final List<List<int>> matrix = [
        [0, 0, 0],
        [0, 1, 0],
        [0, 0, 0],
      ];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0],
      ];
      expect(game.matrix(), expected);
    }, skip: true);

    test('live cells with only one live neighbor die', () {
      final List<List<int>> matrix = [
        [0, 0, 0],
        [0, 1, 0],
        [0, 1, 0],
      ];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0],
      ];
      expect(game.matrix(), expected);
    }, skip: true);

    test('live cells with two live neighbors stay alive', () {
      final List<List<int>> matrix = [
        [1, 0, 1],
        [1, 0, 1],
        [1, 0, 1],
      ];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [
        [0, 0, 0],
        [1, 0, 1],
        [0, 0, 0],
      ];
      expect(game.matrix(), expected);
    }, skip: true);

    test('live cells with three live neighbors stay alive', () {
      final List<List<int>> matrix = [
        [0, 1, 0],
        [1, 0, 0],
        [1, 1, 0],
      ];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [
        [0, 0, 0],
        [1, 0, 0],
        [1, 1, 0],
      ];
      expect(game.matrix(), expected);
    }, skip: true);

    test('dead cells with three live neighbors become alive', () {
      final List<List<int>> matrix = [
        [1, 1, 0],
        [0, 0, 0],
        [1, 0, 0],
      ];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [
        [0, 0, 0],
        [1, 1, 0],
        [0, 0, 0],
      ];
      expect(game.matrix(), expected);
    }, skip: true);

    test('live cells with four or more neighbors die', () {
      final List<List<int>> matrix = [
        [1, 1, 1],
        [1, 1, 1],
        [1, 1, 1],
      ];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [
        [1, 0, 1],
        [0, 0, 0],
        [1, 0, 1],
      ];
      expect(game.matrix(), expected);
    }, skip: true);

    test('bigger matrix', () {
      final List<List<int>> matrix = [
        [1, 1, 0, 1, 1, 0, 0, 0],
        [1, 0, 1, 1, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 1, 1, 1],
        [0, 0, 0, 0, 0, 1, 1, 0],
        [1, 0, 0, 0, 1, 1, 0, 0],
        [1, 1, 0, 0, 0, 1, 1, 1],
        [0, 0, 1, 0, 1, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 1, 1],
      ];
      final game = GameOfLife(matrix);
      game.tick();
      final List<List<int>> expected = [
        [1, 1, 0, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 1, 1, 0],
        [1, 0, 1, 1, 1, 1, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 1],
        [1, 1, 0, 0, 1, 0, 0, 1],
        [1, 1, 0, 1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 1],
      ];
      expect(game.matrix(), expected);
    }, skip: true);
  });
}
