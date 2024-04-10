import 'package:all_your_base/all_your_base.dart';
import 'package:test/test.dart';

void main() {
  final base = AllYourBase();

  test("single bit one to decimal", () {
    final result = base.rebase(2, [1], 10);
    expect(result, equals([1]));
  }, skip: false);

  test("binary to single decimal", () {
    final result = base.rebase(2, [1, 0, 1], 10);
    expect(result, equals([5]));
  }, skip: true);

  test("single decimal to binary", () {
    final result = base.rebase(10, [5], 2);
    expect(result, equals([1, 0, 1]));
  }, skip: true);

  test("binary to multiple decimal", () {
    final result = base.rebase(2, [1, 0, 1, 0, 1, 0], 10);
    expect(result, equals([4, 2]));
  }, skip: true);

  test("decimal to binary", () {
    final result = base.rebase(10, [4, 2], 2);
    expect(result, equals([1, 0, 1, 0, 1, 0]));
  }, skip: true);

  test("trinary to hexadecimal", () {
    final result = base.rebase(3, [1, 1, 2, 0], 16);
    expect(result, equals([2, 10]));
  }, skip: true);

  test("hexadecimal to trinary", () {
    final result = base.rebase(16, [2, 10], 3);
    expect(result, equals([1, 1, 2, 0]));
  }, skip: true);

  test("15-bit integer", () {
    final result = base.rebase(97, [3, 46, 60], 73);
    expect(result, equals([6, 10, 45]));
  }, skip: true);

  test("empty list", () {
    final result = base.rebase(2, [], 10);
    expect(result, equals([0]));
  }, skip: true);

  test("single zero", () {
    final result = base.rebase(10, [0], 2);
    expect(result, equals([0]));
  }, skip: true);

  test("multiple zeros", () {
    final result = base.rebase(10, [0, 0, 0], 2);
    expect(result, equals([0]));
  }, skip: true);

  test("leading zeros", () {
    final result = base.rebase(7, [0, 6, 0], 10);
    expect(result, equals([4, 2]));
  }, skip: true);

  test("input base is one", () {
    expect(() => base.rebase(1, [0], 10), throwsA(isArgumentError));
  }, skip: true);

  test("input base is zero", () {
    expect(() => base.rebase(0, [], 10), throwsA(isArgumentError));
  }, skip: true);

  test("input base is negative", () {
    expect(() => base.rebase(-2, [1], 10), throwsA(isArgumentError));
  }, skip: true);

  test("negative digit", () {
    expect(() => base.rebase(2, [1, -1, 1, 0, 1, 0], 10), throwsA(isArgumentError));
  }, skip: true);

  test("invalid positive digit", () {
    expect(() => base.rebase(2, [1, 2, 1, 0, 1, 0], 10), throwsA(isArgumentError));
  }, skip: true);

  test("output base is one", () {
    expect(() => base.rebase(2, [1, 0, 1, 0, 1, 0], 1), throwsA(isArgumentError));
  }, skip: true);

  test("output base is zero", () {
    expect(() => base.rebase(10, [7], 0), throwsA(isArgumentError));
  }, skip: true);

  test("output base is negative", () {
    expect(() => base.rebase(2, [1], -7), throwsA(isArgumentError));
  }, skip: true);

  test("both bases are negative", () {
    expect(() => base.rebase(-2, [1], -7), throwsA(isArgumentError));
  }, skip: true);
}
