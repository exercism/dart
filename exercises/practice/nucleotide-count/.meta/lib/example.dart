class InvalidNucleotideException implements Exception {}

class NucleotideCount {
  Map<String, int> count(String strand) {
    final result = {"A": 0, "C": 0, "G": 0, "T": 0};

    for (final nucleotide in strand.split('')) {
      if (!result.containsKey(nucleotide)) {
        throw InvalidNucleotideException();
      }

      result[nucleotide] = result[nucleotide]! + 1;
    }

    return result;
  }
}
