class Sieve {
  final int limit;
  Sieve(this.limit);

  List<int> get primes {
    if (limit < 2) {
      return [];
    }

    var candidates = List<bool>.filled(limit + 1, true);
    candidates[0] = false;
    candidates[1] = false;

    void markMultiples(int p, int step) {
      if (candidates[p]) {
        for (var mult = p * p; mult <= limit; mult += step) {
          candidates[mult] = false;
        }
      }
    }

    markMultiples(2, 2);
    for (var p = 3; p * p <= limit; p += 2) {
      markMultiples(p, 2 * p);
    }

    return candidates
        .asMap()
        .entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();
  }
}
