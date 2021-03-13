class Cell {
  /// Row this cell belongs to
  final Row parent;

  /// The position of this cell column.
  final int index;

  /// Wheter this cell is a mine
  bool get isMine => content == "*";

  /// This is a private field so it can only be altered by [Row] and [Minesweeper]
  /// In other words, only elements of this file/library can alter this variable
  int _nearbyMines = 0;
  final String content;

  /// A single cell in the minefield.
  /// It can either be " " or "*" a number or empty.
  Cell(this.parent, this.index, this.content);

  @override
  String toString() {
    if (isMine) return "*";

    /// If there are no columns in the minefield, "" is expected.
    if (content.isEmpty) return "";
    if (_nearbyMines == 0) return " ";
    return "$_nearbyMines";
  }
}

/// This contains all the cells in a single row.
class Row {
  final List<Cell> _cells = [];

  /// Access [index]th cell
  Cell operator [](int index) => _cells[index];

  /// This row in the minefield
  final int index;

  /// [content] is a single item from the input List.
  Row(this.index, String content) {
    /// If the entered string is empty
    /// i.e. no columns.
    if (content.isEmpty) {
      _cells.add(new Cell(this, 0, ""));
    } else {
      _cells.addAll(
        content.split("").map(
              (content) => new Cell(this, _cells.length, content),
            ),
      );
    }
  }

  @override
  String toString() => _cells.join();
}

class Minesweeper {
  final List<Row> _minefield = [];

  /// Access [index]th row
  Row operator [](int index) => _minefield[index];

  /// Annoted version of minefield
  List<String> get annoted => _minefield.map((row) => "$row").toList();

  /// Number of columns in this minefield
  int get columns => _minefield.isEmpty ? 0 : _minefield.first._cells.length;

  /// Number of rows in thie minefield
  int get rows => _minefield.length;

  Minesweeper(List<String> minefield) {
    if (minefield.isNotEmpty) {
      _minefield.addAll(
        minefield.map(
          (content) => new Row(_minefield.length, content),
        ),
      );

      countMines();
    }
  }

  /// This function counts mines surrounding a space " ".
  void countMines() {
    /// Check for no rows.
    if (rows == 0) return;

    /// Check for no columns.
    if (columns == 0) return;

    /// Start looping through all rows.
    for (int i = 0; i < rows; i++) {
      /// For every row, loop through all of its columns.
      for (int j = 0; j < columns; j++) {
        /// If the current cell is not a mine.
        if (!this[i][j].isMine) {
          /// A single Cell [C] has 8 neighbors [N]
          /// 3 at its top, 3 at its bottom
          /// 1 at its left side and 1 at its right.
          ///     "N N N"
          ///     "N C N"
          ///     "N N N"
          /// Which is essentially a range of x,y co-ord.
          /// from -1 to +1, assuming [C] is the center.
          ///
          /// To count nearbyMines, start iterating through
          /// all possible neighbors [N]
          for (int xOffset = -1; xOffset <= 1; xOffset++) {
            for (int yOffset = -1; yOffset <= 1; yOffset++) {
              /// This is the location of current neighbor
              final neighborRow = this[i][j].parent.index + xOffset;
              final neighborColumn = this[i][j].index + yOffset;

              /// This is to make sure the co-ord. are not out or bound.
              if (neighborRow > -1 && neighborRow < rows && neighborColumn > -1 && neighborColumn < columns) {
                /// If this neighbor is a mine, increment total
                if (this[neighborRow][neighborColumn].isMine) {
                  this[i][j]._nearbyMines++;
                }
              }
            }
          }
        }
      }
    }
  }
}
