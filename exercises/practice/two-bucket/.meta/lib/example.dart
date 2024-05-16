import 'dart:math';

class Bucket {
  final String name;
  final int size;
  int amount = 0;
  Bucket(this.name, this.size);

  int capacity() => size - amount;
  bool isFull() => amount == size;
  bool isEmpty() => amount == 0;
  void fill() => amount = size;
  void empty() => amount = 0;
  void pourInto(Bucket other) {
    var quantity = min(this.amount, other.capacity());
    amount -= quantity;
    other.amount += quantity;
  }
}

typedef Result = ({int moves, String goalBucket, int otherBucket});

class TwoBucket {
  late Bucket first;
  late Bucket second;
  final int goal;

  TwoBucket({
    required this.goal,
    required int bucketOne,
    required int bucketTwo,
    required String startBucket
  }) {
    var b1 = Bucket("one", bucketOne);
    var b2 = Bucket("two", bucketTwo);
    if (startBucket == "two") {
      (b2, b1) = (b1, b2);
    }
    first = b1;
    second = b2;
  }

  void validate() {
    if (goal > max(first.size, second.size)) {
      throw ArgumentError('Solution is impossible: goal is too big');
    }
    var gcd = first.size.gcd(second.size);
    if (gcd > 1 && goal % gcd != 0) {
      throw ArgumentError('Solution is impossible: goal is unsatisfiable');
    }
  }

  Result measure() {
    validate();

    var moves = 0;
    first.fill();
    moves++;

    if (second.size == goal) {
      second.fill();
      moves++;
    }

    while (true) {
      if (first.amount == goal) {
        return result(moves, first, second);
      }
      if (second.amount == goal) {
        return result(moves, second, first);
      }

      if (first.isEmpty()) {
        first.fill();
      }
      else if (second.isFull()) {
        second.empty();
      }
      else {
        first.pourInto(second);
      }
      moves++;
    }
  }

  Result result(int moves, Bucket winner, Bucket loser) {
    return (
      moves: moves,
      goalBucket: winner.name,
      otherBucket: loser.amount
    );
  }
}
