import 'package:test/test.dart';
import 'package:yacht/yacht.dart';
import 'package:yacht/categories.dart';

void main() {
  test("Yacht", () {
    final result = Yacht([5, 5, 5, 5, 5]).score(Category.yacht);
    expect(result, equals(50));
  }, skip: false);

  test("Not Yacht", () {
    final result = Yacht([1, 3, 3, 2, 5]).score(Category.yacht);
    expect(result, equals(0));
  }, skip: true);

  test("Ones", () {
    final result = Yacht([1, 1, 1, 3, 5]).score(Category.ones);
    expect(result, equals(3));
  }, skip: true);

  test("Ones, out of order", () {
    final result = Yacht([3, 1, 1, 5, 1]).score(Category.ones);
    expect(result, equals(3));
  }, skip: true);

  test("No ones", () {
    final result = Yacht([4, 3, 6, 5, 5]).score(Category.ones);
    expect(result, equals(0));
  }, skip: true);

  test("Twos", () {
    final result = Yacht([2, 3, 4, 5, 6]).score(Category.twos);
    expect(result, equals(2));
  }, skip: true);

  test("Fours", () {
    final result = Yacht([1, 4, 1, 4, 1]).score(Category.fours);
    expect(result, equals(8));
  }, skip: true);

  test("Yacht counted as threes", () {
    final result = Yacht([3, 3, 3, 3, 3]).score(Category.threes);
    expect(result, equals(15));
  }, skip: true);

  test("Yacht of 3s counted as fives", () {
    final result = Yacht([3, 3, 3, 3, 3]).score(Category.fives);
    expect(result, equals(0));
  }, skip: true);

  test("Fives", () {
    final result = Yacht([1, 5, 3, 5, 3]).score(Category.fives);
    expect(result, equals(10));
  }, skip: true);

  test("Sixes", () {
    final result = Yacht([2, 3, 4, 5, 6]).score(Category.sixes);
    expect(result, equals(6));
  }, skip: true);

  test("Full house two small, three big", () {
    final result = Yacht([2, 2, 4, 4, 4]).score(Category.full_house);
    expect(result, equals(16));
  }, skip: true);

  test("Full house three small, two big", () {
    final result = Yacht([5, 3, 3, 5, 3]).score(Category.full_house);
    expect(result, equals(19));
  }, skip: true);

  test("Two pair is not a full house", () {
    final result = Yacht([2, 2, 4, 4, 5]).score(Category.full_house);
    expect(result, equals(0));
  }, skip: true);

  test("Four of a kind is not a full house", () {
    final result = Yacht([1, 4, 4, 4, 4]).score(Category.full_house);
    expect(result, equals(0));
  }, skip: true);

  test("Yacht is not a full house", () {
    final result = Yacht([2, 2, 2, 2, 2]).score(Category.full_house);
    expect(result, equals(0));
  }, skip: true);

  test("Four of a Kind", () {
    final result = Yacht([6, 6, 4, 6, 6]).score(Category.four_of_a_kind);
    expect(result, equals(24));
  }, skip: true);

  test("Yacht can be scored as Four of a Kind", () {
    final result = Yacht([3, 3, 3, 3, 3]).score(Category.four_of_a_kind);
    expect(result, equals(12));
  }, skip: true);

  test("Full house is not Four of a Kind", () {
    final result = Yacht([3, 3, 3, 5, 5]).score(Category.four_of_a_kind);
    expect(result, equals(0));
  }, skip: true);

  test("Little Straight", () {
    final result = Yacht([3, 5, 4, 1, 2]).score(Category.little_straight);
    expect(result, equals(30));
  }, skip: true);

  test("Little Straight as Big Straight", () {
    final result = Yacht([1, 2, 3, 4, 5]).score(Category.big_straight);
    expect(result, equals(0));
  }, skip: true);

  test("Four in order but not a little straight", () {
    final result = Yacht([1, 1, 2, 3, 4]).score(Category.little_straight);
    expect(result, equals(0));
  }, skip: true);

  test("No pairs but not a little straight", () {
    final result = Yacht([1, 2, 3, 4, 6]).score(Category.little_straight);
    expect(result, equals(0));
  }, skip: true);

  test("Minimum is 1, maximum is 5, but not a little straight", () {
    final result = Yacht([1, 1, 3, 4, 5]).score(Category.little_straight);
    expect(result, equals(0));
  }, skip: true);

  test("Big Straight", () {
    final result = Yacht([4, 6, 2, 5, 3]).score(Category.big_straight);
    expect(result, equals(30));
  }, skip: true);

  test("Big Straight as little straight", () {
    final result = Yacht([6, 5, 4, 3, 2]).score(Category.little_straight);
    expect(result, equals(0));
  }, skip: true);

  test("No pairs but not a big straight", () {
    final result = Yacht([6, 5, 4, 3, 1]).score(Category.big_straight);
    expect(result, equals(0));
  }, skip: true);

  test("Choice", () {
    final result = Yacht([3, 3, 5, 6, 6]).score(Category.choice);
    expect(result, equals(23));
  }, skip: true);

  test("Yacht as choice", () {
    final result = Yacht([2, 2, 2, 2, 2]).score(Category.choice);
    expect(result, equals(10));
  }, skip: true);
}
