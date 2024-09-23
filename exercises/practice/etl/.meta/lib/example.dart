class Etl {
  Map<String, int> transform(Map<String, List<String>> legacy) {
    final result = <String, int>{};

    for (final entry in legacy.entries) {
      final score = int.parse(entry.key);
      for (final letter in entry.value) {
        result[letter.toLowerCase()] = score;
      }
    }
    return result;
  }
}
