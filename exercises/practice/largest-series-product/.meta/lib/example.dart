import 'dart:math';

class LargestSeriesProduct {
  int largestProduct(String number, int span) {
    if (span < 0) {
      throw new ArgumentError('span must not be negative');
    }
    if (span > number.length) {
      throw new ArgumentError('span must be smaller than string length');
    }

    List<int> digits = number.codeUnits.map((cp) => cp - 48).toList();
    if (digits.any((n) => n < 0 || n > 9)) {
      throw new ArgumentError('digits input must only contain digits');
    }

    var largest = 0;
    for (var i = 0; i <= digits.length - span; i++) {
      var prod = digits.sublist(i, i + span).fold(1, (p, n) => p * n);
      largest = max(largest, prod);
    }
    return largest;
  }
}
