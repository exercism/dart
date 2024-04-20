class Yacht {
  static int yacht(List<int> dice) {
    Set<int> uniq = Set.from(dice);
    return uniq.length == 1 ? 50 : 0;
  }

  static int choice(List<int> dice) {
    return dice.fold(0, (sum, die) => sum + die);
  }

  static Map<int, int> count(List<int> dice) {
    var empty = <int, int>{1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0};
    return dice.fold(empty, (counts, die) {
      counts.update(die, (c) => c + 1);
      return counts;
    });
  }

  static int four_of_a_kind(List<int> dice) {
    var c = count(dice);
    int score = 0;
    c.forEach((die, count) {
      if (count >= 4) score = 4 * die;
    });
    return score;
  }

  static int full_house(List<int> dice) {
    var c = count(dice);
    c.removeWhere((_, count) => count == 0);
    return c.length == 2 && c.containsValue(3) ? choice(dice) : 0;
  }

  static int little_straight(List<int> dice) {
    return Set.from(dice).containsAll({1, 2, 3, 4, 5}) ? 30 : 0;
  }

  static int big_straight(List<int> dice) {
    return Set.from(dice).containsAll({2, 3, 4, 5, 6}) ? 30 : 0;
  }

  static int ones(List<int> dice) => singles(dice, 1);
  static int twos(List<int> dice) => singles(dice, 2);
  static int threes(List<int> dice) => singles(dice, 3);
  static int fours(List<int> dice) => singles(dice, 4);
  static int fives(List<int> dice) => singles(dice, 5);
  static int sixes(List<int> dice) => singles(dice, 6);

  static int singles(List<int> dice, int die) {
    var c = count(dice);
    return die * (c[die] ?? 0);
  }
}
