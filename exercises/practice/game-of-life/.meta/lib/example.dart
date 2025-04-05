class GameOfLife {
  List<List<int>> _matrix;

  GameOfLife(matrix) : _matrix = matrix;

  List<List<int>> matrix() {
    return _matrix;
  }

  void tick() {
    if (_matrix.isEmpty) return;

    final rows = _matrix.length;
    final cols = _matrix[0].length;
    final newMatrix = List.generate(rows, (_) => List.filled(cols, 0));

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        final liveNeighbors = _countLiveNeighbors(row, col);
        if (_matrix[row][col] == 1 &&
            (liveNeighbors == 2 || liveNeighbors == 3)) {
          newMatrix[row][col] = 1;
        } else if (_matrix[row][col] == 0 && liveNeighbors == 3) {
          newMatrix[row][col] = 1;
        }
      }
    }

    _matrix = newMatrix;
  }

  int _countLiveNeighbors(int row, int col) {
    int count = 0;
    final rows = _matrix.length;
    final cols = _matrix[0].length;

    for (var nRow = row - 1; nRow <= row + 1; nRow++) {
      for (var nCol = col - 1; nCol <= col + 1; nCol++) {
        if (nRow == row && nCol == col) continue;

        if (nRow >= 0 && nRow < rows && nCol >= 0 && nCol < cols) {
          count += _matrix[nRow][nCol];
        }
      }
    }

    return count;
  }
}
