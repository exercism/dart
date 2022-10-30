class Hamming {
  int distance(String a, String b) {
    if (a.length != b.length) {
      throw ArgumentError('strands must be of equal length');
    }

    int diff = 0;

    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        diff++;
      }
    }

    return diff;
  }
}
