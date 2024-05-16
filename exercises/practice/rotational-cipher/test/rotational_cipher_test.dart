import 'package:rotational_cipher/rotational_cipher.dart';
import 'package:test/test.dart';

void main() {
  final cipher = RotationalCipher();

  test("rotate a by 0, same output as input", () {
    final result = cipher.rotate(text: "a", shiftKey: 0);
    expect(result, equals("a"));
  }, skip: false);

  test("rotate a by 1", () {
    final result = cipher.rotate(text: "a", shiftKey: 1);
    expect(result, equals("b"));
  }, skip: true);

  test("rotate a by 26, same output as input", () {
    final result = cipher.rotate(text: "a", shiftKey: 26);
    expect(result, equals("a"));
  }, skip: true);

  test("rotate m by 13", () {
    final result = cipher.rotate(text: "m", shiftKey: 13);
    expect(result, equals("z"));
  }, skip: true);

  test("rotate n by 13 with wrap around alphabet", () {
    final result = cipher.rotate(text: "n", shiftKey: 13);
    expect(result, equals("a"));
  }, skip: true);

  test("rotate capital letters", () {
    final result = cipher.rotate(text: "OMG", shiftKey: 5);
    expect(result, equals("TRL"));
  }, skip: true);

  test("rotate spaces", () {
    final result = cipher.rotate(text: "O M G", shiftKey: 5);
    expect(result, equals("T R L"));
  }, skip: true);

  test("rotate numbers", () {
    final result = cipher.rotate(text: "Testing 1 2 3 testing", shiftKey: 4);
    expect(result, equals("Xiwxmrk 1 2 3 xiwxmrk"));
  }, skip: true);

  test("rotate punctuation", () {
    final result = cipher.rotate(text: "Let's eat, Grandma!", shiftKey: 21);
    expect(result, equals("Gzo'n zvo, Bmviyhv!"));
  }, skip: true);

  test("rotate all letters", () {
    final result = cipher.rotate(text: "The quick brown fox jumps over the lazy dog.", shiftKey: 13);
    expect(result, equals("Gur dhvpx oebja sbk whzcf bire gur ynml qbt."));
  }, skip: true);
}
