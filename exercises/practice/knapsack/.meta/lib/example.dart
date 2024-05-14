import 'dart:math';

typedef Item = ({int weight, int value});

class Knapsack {
  final int maxWeight;
  Knapsack({required this.maxWeight});

  int maxValue(List<Item> items) {
    var table = List.filled(maxWeight + 1, 0);
    for (var item in items) {
      if (item.weight <= maxWeight) {
        for (var w = maxWeight; w >= item.weight; w--) {
          table[w] = max(table[w], table[w - item.weight] + item.value);
        }
      }
    }
    return table.last;
  }
}
