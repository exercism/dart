class PascalsTriangle {
  List<List<int>> rows(int rows) {
    /// Row that was last inserted in the triangle.
    /// This also adds stateful behaviour to the closure passed to List.generate.
    List<int> triangle = [];

    return List.generate(rows, (rowIndex) {
      triangle = [
        /// The 1 that always has to be in the first index of a row.
        1,

        /// Expand on triangle, only if it's length is greater than 1.
        if (triangle.length > 1)
          for (int i = 1; i < triangle.length; i++) triangle[i - 1] + triangle[i],

        /// Trailing 1, only if this row's length is greater than 1.
        if (rowIndex > 0) 1,
      ];

      return triangle;
    });
  }
}
