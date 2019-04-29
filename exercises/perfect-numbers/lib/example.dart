class PerfectNumbers {
  String classify(int input) {
    if (input <= 0) {
      throw new ArgumentError('Classification is only possible for natural numbers');
    }

    int aliquot = 0;
    for (int i = 1; i < input; i++) {
      if (input % i == 0) {
        aliquot += i;
      }
    }

    if (aliquot == input) {
      return "perfect";
    } else if (aliquot > input) {
      return "abundant";
    } else {
      return "deficient";
    }
  }
}
