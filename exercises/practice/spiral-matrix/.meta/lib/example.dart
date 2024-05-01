class SpiralMatrix {
  final int size;
  SpiralMatrix(this.size);

  List<List<int>> toList() {
    if (size == 0) {
      return [];
    }

    List<List<int>> m = [];
    for (var i = 1; i <= size; i++) {
      m.add(List.filled(size, -1));
    }

    // starting in the top-left cell
    var r = 0;
    var c = 0;

    // setup "delta_row" and "delta_col" so we can advance step by step.
    // These cycles determine the [dr,dc] pairs so we can walk a straight line
    // until we need to turn.
    var dr_cycle = Cycle([0, 1, 0, -1]);
    var dc_cycle = Cycle([1, 0, -1, 0]);
    var dr = dr_cycle.next();
    var dc = dc_cycle.next();

    // We know how many cells to populate
    for (var i = 1; i <= size * size; i++) {
      m[r][c] = i;
      // If we hit a boundary or an already populated cell, turn
      if ([-1, size].contains(r + dr) ||
          [-1, size].contains(c + dc) ||
          m[r + dr][c + dc] != -1) {
        dr = dr_cycle.next();
        dc = dc_cycle.next();
      }
      // advance to the next cell
      r += dr;
      c += dc;
    }

    return m;
  }
}

class Cycle {
  List<int> values;
  int idx = 0;
  Cycle(this.values);

  int next() {
    int value = values[idx];
    idx = (idx + 1) % values.length;
    return value;
  }
}
