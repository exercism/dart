class PascalsTriangle {
  List<List<int>> rows(int rows) {
    if (rows <= 0) {
      return [];
    } else {
      final triangle = <List<int>>[];

      for (int x = 1; x <= rows; x++) {
        final nextRow = <int>[];

        if (triangle.length > 1) {
          nextRow.add(1);
          final previousRow = triangle.elementAt(triangle.length - 1);

          for (int i = 1; i < previousRow.length; i++) {
            nextRow.add(previousRow[i - 1] + previousRow[i]);
          }
        } else if (triangle.length == 1) {
          nextRow.add(1);
        }

        nextRow.add(1);
        triangle.add(nextRow);
      }

      return triangle;
    }
  }
}
