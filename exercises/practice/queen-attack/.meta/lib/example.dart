class Queen {
  final int row;
  final int column;

  Queen(int row, int column)
      : assert(row >= 0, 'row not positive'),
        assert(row <= 7, 'row not on board'),
        assert(column >= 0, 'column not positive'),
        assert(column <= 7, 'column not on board'),
        this.row = row,
        this.column = column;

  bool canAttack(Queen other) =>
      this.row == other.row ||
      this.column == other.column ||
      (this.row - other.row).abs() == (this.column - other.column).abs();
}
