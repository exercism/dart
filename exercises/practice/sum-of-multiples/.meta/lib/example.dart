class SumOfMultiples {

  int sum(List<int> rootArray, int limit) {
    final multiplesTracked = <int>{};

    for (final num in rootArray) {
      for (int count = 1; num != 0 && (num * count) < limit; count++) {
        multiplesTracked.add(num * count);
      }
    }

    return multiplesTracked.fold<int>(0, _addUpMultiples);
  }

  int _addUpMultiples(int currentSum, int arrayValue) => currentSum + arrayValue;
}
