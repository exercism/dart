class AllYourBase {
  List<int> rebase(int inputBase, List<int> digits, int outputBase) {
    int decimal = toDecimal(inputBase, digits);
    return toBase(outputBase, decimal);
  }

  int toDecimal(int inputBase, List<int> digits) {
    if (inputBase < 2) {
      throw ArgumentError('input base must be >= 2');
    }
    if (digits.any((digit) => digit < 0 || digit >= inputBase)) {
      throw ArgumentError('all digits must satisfy 0 <= d < input base');
    }

    return digits.fold(0, (dec, digit) => dec * inputBase + digit);
  }

  List<int> toBase(int outputBase, int decimal) {
    if (outputBase < 2) {
      throw ArgumentError('output base must be >= 2');
    }
    if (decimal == 0) {
      return [0];
    }

    List<int> digits = [];
    while (decimal > 0) {
      digits.insert(0, decimal % outputBase);
      decimal ~/= outputBase;
    }
    return digits;
  }
}
