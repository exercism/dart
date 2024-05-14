import 'package:knapsack/knapsack.dart';
import 'package:test/test.dart';

void main() {
  test("no items", () {
    final knapsack = Knapsack(maxWeight: 100);
    final value = knapsack.maxValue([]);
    expect(value, equals(0));
  }, skip: false);

  test("one item, too heavy", () {
    final knapsack = Knapsack(maxWeight: 10);
    final value = knapsack.maxValue([(weight: 100, value: 1)]);
    expect(value, equals(0));
  }, skip: true);

  test("five items (cannot be greedy by weight)", () {
    final knapsack = Knapsack(maxWeight: 10);
    final value = knapsack.maxValue([
      (weight: 2, value: 5),
      (weight: 2, value: 5),
      (weight: 2, value: 5),
      (weight: 2, value: 5),
      (weight: 10, value: 21)
    ]);
    expect(value, equals(21));
  }, skip: true);

  test("five items (cannot be greedy by value)", () {
    final knapsack = Knapsack(maxWeight: 10);
    final value = knapsack.maxValue([
      (weight: 2, value: 20),
      (weight: 2, value: 20),
      (weight: 2, value: 20),
      (weight: 2, value: 20),
      (weight: 10, value: 50)
    ]);
    expect(value, equals(80));
  }, skip: true);

  test("example knapsack", () {
    final knapsack = Knapsack(maxWeight: 10);
    final value = knapsack
        .maxValue([(weight: 5, value: 10), (weight: 4, value: 40), (weight: 6, value: 30), (weight: 4, value: 50)]);
    expect(value, equals(90));
  }, skip: true);

  test("8 items", () {
    final knapsack = Knapsack(maxWeight: 104);
    final value = knapsack.maxValue([
      (weight: 25, value: 350),
      (weight: 35, value: 400),
      (weight: 45, value: 450),
      (weight: 5, value: 20),
      (weight: 25, value: 70),
      (weight: 3, value: 8),
      (weight: 2, value: 5),
      (weight: 2, value: 5)
    ]);
    expect(value, equals(900));
  }, skip: true);

  test("15 items", () {
    final knapsack = Knapsack(maxWeight: 750);
    final value = knapsack.maxValue([
      (weight: 70, value: 135),
      (weight: 73, value: 139),
      (weight: 77, value: 149),
      (weight: 80, value: 150),
      (weight: 82, value: 156),
      (weight: 87, value: 163),
      (weight: 90, value: 173),
      (weight: 94, value: 184),
      (weight: 98, value: 192),
      (weight: 106, value: 201),
      (weight: 110, value: 210),
      (weight: 113, value: 214),
      (weight: 115, value: 221),
      (weight: 118, value: 229),
      (weight: 120, value: 240)
    ]);
    expect(value, equals(1458));
  }, skip: true);
}
