class Cell {
  /// Row this cell belongs to
  final Row parent;

  /// The position of this cell column.
  final int index;

  /// Wheter this cell is a flower
  bool get isFlower => content == "*";

  /// This is a private field so it can only be altered by [Row] and [FlowerField]
  /// In other words, only elements of this file/library can alter this variable
  int _nearbyFlowers = 0;
  final String content;

  /// A single cell in the garden.
  /// It can either be " " or "*" a number or empty.
  Cell(this.parent, this.index, this.content);

  @override
  String toString() {
    if (isFlower) return "*";

    /// If there are no columns in the garden, "" is expected.
    if (content.isEmpty) return "";
    if (_nearbyFlowers == 0) return " ";
    return "$_nearbyFlowers";
  }
}

/// This contains all the cells in a single row.
class Row {
  final List<Cell> _cells = [];

  /// Access [index]th cell
  Cell operator [](int index) => _cells[index];

  /// This row in the garden
  final int index;

  /// [content] is a single item from the input List.
  Row(this.index, String content) {
    /// If the entered string is empty
    /// i.e. no columns.
    if (content.isEmpty) {
      _cells.add(new Cell(this, 0, ""));
    } else {
      _cells.addAll(
        content.split("").map((content) => new Cell(this, _cells.length, content)),
      );
    }
  }

  @override
  String toString() => _cells.join();
}

class FlowerField {
  final List<Row> _garden = [];

  /// Access [index]th row
  Row operator [](int index) => _garden[index];

  /// Annoted version of garden
  List<String> get annotated => _garden.map((row) => "$row").toList();

  /// Number of columns in this garden
  int get columns => _garden.isEmpty ? 0 : _garden.first._cells.length;

  /// Number of rows in thie garden
  int get rows => _garden.length;

  FlowerField(List<String> garden) {
    if (garden.isNotEmpty) {
      _garden.addAll(garden.map((content) => new Row(_garden.length, content)));

      countFlowers();
    }
  }

  /// This function counts flowers surrounding a space " ".
  void countFlowers() {
    /// Check for no rows.
    if (rows == 0) return;

    /// Check for no columns.
    if (columns == 0) return;

    /// Start looping through all rows.
    for (int i = 0; i < rows; i++) {
      /// For every row, loop through all of its columns.
      for (int j = 0; j < columns; j++) {
        /// If the current cell is not a flower.
        if (!this[i][j].isFlower) {
          /// A single Cell [C] has 8 neighbors [N]
          /// 3 at its top, 3 at its bottom
          /// 1 at its left side and 1 at its right.
          ///     "N N N"
          ///     "N C N"
          ///     "N N N"
          /// Which is essentially a range of x,y co-ord.
          /// from -1 to +1, assuming [C] is the center.
          ///
          /// To count nearby flowers, start iterating through
          /// all possible neighbors [N]
          for (int xOffset = -1; xOffset <= 1; xOffset++) {
            for (int yOffset = -1; yOffset <= 1; yOffset++) {
              /// This is the location of current neighbor
              final neighborRow = this[i][j].parent.index + xOffset;
              final neighborColumn = this[i][j].index + yOffset;

              /// This is to make sure the co-ord. are not out or bound.
              if (neighborRow > -1 && neighborRow < rows && neighborColumn > -1 && neighborColumn < columns) {
                /// If this neighbor is a flower, increment total
                if (this[neighborRow][neighborColumn].isFlower) {
                  this[i][j]._nearbyFlowers++;
                }
              }
            }
          }
        }
      }
    }
  }
}
