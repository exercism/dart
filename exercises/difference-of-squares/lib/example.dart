import "dart:math" show pow;

class DifferenceOfSquares {
  num squareOfSum(int input) => pow(_sum(input), 2);

  num sumOfSquare(int input) => _range(input).map((i) => pow(i, 2)).reduce((r, i) => r + i);

  num differenceOfSquares(int input) => squareOfSum(input) - sumOfSquare(input);

  num _sum(int input) => input * (input + 1) ~/ 2;

  List<int> _range(int length) => new List<int>.generate(length, (i) => i + 1);
}
