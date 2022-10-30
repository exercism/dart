class CollatzConjecture {
  int steps(int input) {
    if (input < 1) {
      throw new ArgumentError('Only positive integers are allowed');
    }

    int n = input;
    int steps = 0;
    while (n != 1) {
      if (n % 2 == 0) {
        n = n ~/ 2;
      } else {
        n = 3 * n + 1;
      }
      steps += 1;
    }

    return steps;
  }
}
