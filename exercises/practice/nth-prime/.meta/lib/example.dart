import 'dart:math';

class NthPrime {
  int prime(int number) {
    if (number < 1) {
      throw new ArgumentError('There is no zeroth prime');
    }

    int primes = 0;
    int i = 1;

    while (primes < number) {
      i += 1;
      if (_isPrime(i)) {
        primes += 1;
      }
    }
    return i;
  }

  bool _isPrime(int n) {
    if (n == 1) {
      return false;
    }
    if (n == 2) {
      return true;
    }
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }
}
