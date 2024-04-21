import 'package:yacht/categories.dart';

class Yacht {
  List<int> dice;

  Yacht(this.dice);

  int score(Category category) {
    return switch(category) {
      Category.ones => singles(1),
      Category.twos => singles(2),
      Category.threes => singles(3),
      Category.fours => singles(4),
      Category.fives => singles(5),
      Category.sixes => singles(6),
      Category.full_house => full_house(),
      Category.four_of_a_kind => four_of_a_kind(),
      Category.little_straight => little_straight(),
      Category.big_straight => big_straight(),
      Category.choice => choice(),
      Category.yacht => yacht(),
    };
  }

  int yacht() {
    Set<int> uniq = Set.from(dice);
    return uniq.length == 1 ? 50 : 0;
  }

  int choice() => dice.fold(0, (sum, die) => sum + die);

  Map<int, int> _count() {
    var empty = <int, int>{1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0};
    return dice.fold(empty, (counts, die) {
      counts.update(die, (c) => c + 1);
      return counts;
    });
  }

  int four_of_a_kind() {
    var c = _count();
    int score = 0;
    c.forEach((die, count) {
      if (count >= 4) score = 4 * die;
    });
    return score;
  }

  int full_house() {
    var c = _count();
    c.removeWhere((_, count) => count == 0);
    return c.length == 2 && c.containsValue(3) ? choice() : 0;
  }

  int little_straight() => _straight({1, 2, 3, 4, 5});
  int big_straight() => _straight({2, 3, 4, 5, 6});
  int _straight(Set<int> needed) => Set.from(dice).containsAll(needed) ? 30 : 0;

  int singles(int die) {
    var c = _count();
    return die * (c[die] ?? 0);
  }
}
