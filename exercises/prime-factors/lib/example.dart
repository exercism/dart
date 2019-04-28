class PrimeFactors {
  List<int> factors(int value) {
    List<int> factors = [];
    int divisor = 2;

    while (value > 1) {
      while (value % divisor == 0) {
        factors.add(divisor);
        value = value ~/ divisor;
      }
      divisor++;
    }
    return factors;
  }
}
