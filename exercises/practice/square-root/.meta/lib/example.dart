class SquareRoot {
  int squareRoot(int radicand) {
    if (radicand == 1) {
      return 1;
    }

    int guess = radicand ~/ 2;

    while (guess * guess != radicand) {
      guess = (guess + radicand ~/ guess) ~/ 2;
    }

    return guess;
  }
}
