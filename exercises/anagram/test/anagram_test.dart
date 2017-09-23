import 'package:test/test.dart';
import 'package:anagram/anagram.dart';

Anagram anagram = new Anagram();

void main() {
  // Simple
  test("no matches", () {
    expect(anagram.findAngrams("diaper", ["hello", "world", "zombies", "pants"]), equals([]));
  });

  test("detects simple anagram", () {
    expect(anagram.findAngrams("ant", ["tan", "stand", "at"]), equals(["tan"]));
  });

  test("does not detect false positives", () {
    expect(anagram.findAngrams("galea", ["eagle"]), equals([]));
  });

  // Mid Range
  test("detects two anagrams", () {
    expect(anagram.findAngrams("master", ["stream", "pigeon", "maters"]), equals(["stream", "maters"]));
  });

  test("does not detect anagram subsets", () {
    expect(anagram.findAngrams("good", ["dog", "goody"]), equals([]));
  });

  test("detects anagram", () {
    expect(anagram.findAngrams("listen", ["enlists", "google", "inlets", "banana"]), equals(["inlets"]));
  });

  test("detects anagram", () {
    expect(anagram.findAngrams("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]),
        equals(["gallery", "regally", "largely"]));
  });

  // More Challenging
  // Suggesting moving it up higher
  test("does not detect a word as its own anagram", () {
    expect(anagram.findAngrams("banana", ["Banana"]), equals([]));
  });

  test("does not detect identical words", () {
    expect(anagram.findAngrams("corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]), equals(["cron"]));
  });

  test("does not detect non-anagrams with identical checksum", () {
    expect(anagram.findAngrams("mass", ["last"]), equals([]));
  });

  test("detects anagrams case-insensitively", () {
    expect(anagram.findAngrams("Orchestra", ["cashregister", "Carthorse", "radishes"]), equals(["Carthorse"]));
  });

  test("detects anagrams using case-insensitive subject", () {
    expect(anagram.findAngrams("Orchestra", ["cashregister", "carthorse", "radishes"]), equals(["carthorse"]));
  });

  test("detects anagrams using case-insensitive possible matches", () {
    expect(anagram.findAngrams("orchestra", ["cashregister", "Carthorse", "radishes"]), equals(["Carthorse"]));
  });

  test("does not detect a anagram if the original word is repeated", () {
    expect(anagram.findAngrams("go", ["go Go GO"]), equals([]));
  });

  test("anagrams must use all letters exactly once", () {
    expect(anagram.findAngrams("tapper", ["patter"]), equals([]));
  });

  test("capital word is not own anagram", () {
    expect(anagram.findAngrams("BANANA", ["Banana"]), equals([]));
  });
}
