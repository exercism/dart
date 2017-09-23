import 'package:test/test.dart';
import 'package:anagram/anagram.dart';

Anagram anagram = new Anagram();

void main() {

  group("simple tests", simpleTests);

  group("slightly less simple tests", slightlyLessSimpleTests);

  group("more challenging tests", moreChallengingTests);

  /// Edge cases are scenarios that are problems that occur under specific conditions
  /// Read more: https://en.wikipedia.org/wiki/Edge_case
  group("edge case tests", edgeCaseTests);
}

void simpleTests() {
  test("no matches", () {
    expect(anagram.findAngrams("diaper", ["hello", "world", "zombies", "pants"]), equals([]));
  });

  test("detects simple anagram", () {
    expect(anagram.findAngrams("ant", ["tan", "stand", "at"]), equals(["tan"]));
  }, skip: true);

  test("does not detect false positives", () {
    expect(anagram.findAngrams("galea", ["eagle"]), equals([]));
  }, skip: true);
}

void slightlyLessSimpleTests() {
  test("detects two anagrams", () {
    expect(anagram.findAngrams("master", ["stream", "pigeon", "maters"]), equals(["stream", "maters"]));
  }, skip: true);

  test("does not detect anagram subsets", () {
    expect(anagram.findAngrams("good", ["dog", "goody"]), equals([]));
  }, skip: true);

  test("detects anagram", () {
    expect(anagram.findAngrams("listen", ["enlists", "google", "inlets", "banana"]), equals(["inlets"]));
  }, skip: true);

  test("detects anagram", () {
    expect(anagram.findAngrams("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]),
        equals(["gallery", "regally", "largely"]));
  }, skip: true);
}

void moreChallengingTests() {
  test("does not detect a word as its own anagram", () {
    expect(anagram.findAngrams("banana", ["Banana"]), equals([]));
  }, skip: true);

  test("does not detect identical words", () {
    expect(anagram.findAngrams("corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]), equals(["cron"]));
  }, skip: true);

  test("does not detect non-anagrams with identical checksum", () {
    expect(anagram.findAngrams("mass", ["last"]), equals([]));
  }, skip: true);

  test("detects anagrams case-insensitively", () {
    expect(anagram.findAngrams("Orchestra", ["cashregister", "Carthorse", "radishes"]), equals(["Carthorse"]));
  }, skip: true);

  test("detects anagrams using case-insensitive subject", () {
    expect(anagram.findAngrams("Orchestra", ["cashregister", "carthorse", "radishes"]), equals(["carthorse"]));
  }, skip: true);

  test("detects anagrams using case-insensitive possible matches", () {
    expect(anagram.findAngrams("orchestra", ["cashregister", "Carthorse", "radishes"]), equals(["Carthorse"]));
  }, skip: true);
}

void edgeCaseTests() {
  test("does not detect a anagram if the original word is repeated", () {
    expect(anagram.findAngrams("go", ["go Go GO"]), equals([]));
  }, skip: true);

  test("anagrams must use all letters exactly once", () {
    expect(anagram.findAngrams("tapper", ["patter"]), equals([]));
  }, skip: true);

  test("capital word is not own anagram", () {
    expect(anagram.findAngrams("BANANA", ["Banana"]), equals([]));
  }, skip: true);
}