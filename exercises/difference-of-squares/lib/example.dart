import "dart:math" show pow;

class DifferenceOfSquares {
  int squareOfSum(int input) => pow(_sum(input), 2);

  int sumOfSquare(int input) => _range(input).map((i) => pow(i, 2)).reduce((r, i) => r + i);

  int differenceOfSquares(int input) => squareOfSum(input) - sumOfSquare(input);

  int _sum(int input) => input * (input + 1) ~/ 2;

  List<int> _range(int length) => new List<int>.generate(length, (i) => i + 1);
}
