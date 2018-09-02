class PascalsTriangle {
  List<List<int>> rows(int rows) {
    if (rows <= 0) {
      return [];
    } else {
      List<List<int>> triangle = new List<List<int>>();

      for (int x = 1; x <= rows; x++) {
        List<int> nextRow = new List<int>(x)
          ..[0] = 1
          ..[x - 1] = 1;
        if (triangle.length > 1) {
          List<int> previousRow = triangle.elementAt(triangle.length - 1);
          for (int i = 1; i < previousRow.length; i++) {
            nextRow[i] = previousRow[i - 1] + previousRow[i];
          }
        }
        triangle.add(nextRow);
      }

      return triangle;
    }
  }
}
