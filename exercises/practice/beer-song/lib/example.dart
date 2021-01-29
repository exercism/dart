class BeerSong {
  List<String> recite(int start, int numVerses) {
    final verses = <String>[];

    for (var i = 0; i < numVerses; i++) {
      int num = start - i;

      if (num > 2) {
        verses.add('$num bottles of beer on the wall, $num bottles of beer.');
        verses.add('Take one down and pass it around, ${num - 1} bottles of beer on the wall.');
      } else if (num == 2) {
        verses.add('2 bottles of beer on the wall, 2 bottles of beer.');
        verses.add('Take one down and pass it around, 1 bottle of beer on the wall.');
      } else if (num == 1) {
        verses.add('1 bottle of beer on the wall, 1 bottle of beer.');
        verses.add('Take it down and pass it around, no more bottles of beer on the wall.');
      } else if (num == 0) {
        verses.add('No more bottles of beer on the wall, no more bottles of beer.');
        verses.add('Go to the store and buy some more, 99 bottles of beer on the wall.');
      }

      if (numVerses > 1 && i != numVerses - 1) {
        verses.add('');
      }
    }

    return verses;
  }
}
