class Diamond {
  List<String> rows(String letter) {
    if (letter.isEmpty || letter.length > 1 || !_inAlphaRange(letter)) {
      return [];
    } else {
      int diamondSize = (letter.codeUnitAt(0) - 64);
      int maxStringSize = diamondSize * 2 - 1;
      List<String> diamond = <String>[];

      for (int i = 0; i < diamondSize; i++) {
        String row = "".padRight(maxStringSize, " ");
        if (i == 0) {
          diamond.add(row.replaceRange(0, 1, letter).replaceRange(row.length - 1, row.length, letter));
        } else {
          String nextLetter = new String.fromCharCode(letter.codeUnitAt(0) - i);
          row = row.replaceRange(i, i, nextLetter).replaceRange(row.length - (i + 1), row.length - (i - 1), nextLetter);
          diamond.insert(0, row);
          diamond.add(row);
        }
      }

      return diamond;
    }
  }

  bool _inAlphaRange(String letter) {
    int codePoint = letter.codeUnitAt(0);
    return codePoint >= 65 && codePoint <= 90;
  }
}
