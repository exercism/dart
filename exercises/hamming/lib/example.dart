class Hamming {
  int compute(String a, String b) {
    if (a.length != b.length) {
      throw new ArgumentError("DNA strands must be of equal length.");
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
