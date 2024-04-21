import 'package:binary_search/binary_search.dart';
import 'package:binary_search/value_not_found_exception.dart';
import 'package:test/test.dart';

void main() {
  test("finds a value in an array with one element", () {
    final index = BinarySearch([6]).find(6);
    expect(index, equals(0));
  }, skip: false);

  test("finds a value in the middle of an array", () {
    final index = BinarySearch([1, 3, 4, 6, 8, 9, 11]).find(6);
    expect(index, equals(3));
  }, skip: true);

  test("finds a value at the beginning of an array", () {
    final index = BinarySearch([1, 3, 4, 6, 8, 9, 11]).find(1);
    expect(index, equals(0));
  }, skip: true);

  test("finds a value at the end of an array", () {
    final index = BinarySearch([1, 3, 4, 6, 8, 9, 11]).find(11);
    expect(index, equals(6));
  }, skip: true);

  test("finds a value in an array of odd length", () {
    final index = BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634]).find(144);
    expect(index, equals(9));
  }, skip: true);

  test("finds a value in an array of even length", () {
    final index = BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]).find(21);
    expect(index, equals(5));
  }, skip: true);

  test("identifies that a value is not included in the array", () {
    expect(() => BinarySearch([1, 3, 4, 6, 8, 9, 11]).find(7), throwsA(isA<ValueNotFoundException>()));
  }, skip: true);

  test("a value smaller than the array's smallest value is not found", () {
    expect(() => BinarySearch([1, 3, 4, 6, 8, 9, 11]).find(0), throwsA(isA<ValueNotFoundException>()));
  }, skip: true);

  test("a value larger than the array's largest value is not found", () {
    expect(() => BinarySearch([1, 3, 4, 6, 8, 9, 11]).find(13), throwsA(isA<ValueNotFoundException>()));
  }, skip: true);

  test("nothing is found in an empty array", () {
    expect(() => BinarySearch([]).find(1), throwsA(isA<ValueNotFoundException>()));
  }, skip: true);

  test("nothing is found when the left and right bounds cross", () {
    expect(() => BinarySearch([1, 2]).find(0), throwsA(isA<ValueNotFoundException>()));
  }, skip: true);
}
