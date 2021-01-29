class Triangle {
  bool _check(num a, num b, num c) {
    return [a, b, c].every((t) => t > 0) && (a <= b + c) && (b <= c + a) && (c <= a + b);
  }

  bool equilateral(num a, num b, num c) {
    return _check(a, b, c) && (a == b) && (b == c);
  }

  bool isosceles(num a, num b, num c) {
    return _check(a, b, c) && ((a == b) || (b == c) || (c == a));
  }

  bool scalene(num a, num b, num c) {
    return _check(a, b, c) && (a != b) && (b != c) && (c != a);
  }
}
