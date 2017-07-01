import "dart:math" show pow;

class DifferenceOfSquares {
  int squareOfSums(int input) => pow(_sum(input), 2);

  int sumOfSquares(int input) => _range(input).map((i) => pow(i, 2)).reduce((r, i) => r + i);

  int difference(int input) => squareOfSums(input) - sumOfSquares(input);

  int _sum(int input) => input * (input + 1) ~/ 2;

  List<int> _range(int length) => new List<int>.generate(length, (i) => i + 1);
}
