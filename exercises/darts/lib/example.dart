import 'dart:math';

class Darts {
  int score(num x, num y) {
    final distanceToDart = sqrt(x * x + y * y);

    if (distanceToDart > 10) return 0;
    if (distanceToDart > 5) return 1;
    if (distanceToDart > 1) return 5;
    return 10;
  }
}
