enum Classification {
  perfect,
  abundant,
  deficient,
}

class PerfectNumbers {
  Classification classify(int number) {
    if (number <= 0) {
      throw ArgumentError('Number must be greater than 0');
    }

    var sum = 0;
    for (var i = 1; i < number; i++) {
      if (number % i == 0) {
        sum += i;
      }
    }

    if (sum == number) {
      return Classification.perfect;
    } else if (sum > number) {
      return Classification.abundant;
    } else {
      return Classification.deficient;
    }
  }
}
