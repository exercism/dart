import 'package:test/test.dart';
import 'package:word_count/word_count.dart';

final WordCount myWordCounter = new WordCount();

void main() {
  group("WordCount: Simple Tests - ", simpleTests);
  group("WordCount: Ignore special characters - ", ignoreSpecialCharacters);
  group("WordCount: Works with numbers too - ", notJustWords);
  group("WordCount: Edge case - ", edgeCases);
}

void simpleTests() {
  test("count one word", () {
    expect(myWordCounter.countWords("word"), equals({"word": 1}));
  }, skip: false);
  test("count one of each word", () {
    expect(myWordCounter.countWords("one of each"), equals({"one": 1, "of": 1, "each": 1}));
  }, skip: true);
  test("multiple occurrences of a word", () {
    expect(myWordCounter.countWords("one fish two fish red fish blue fish"),
        equals({"one": 1, "fish": 4, "two": 1, "red": 1, "blue": 1}));
  }, skip: true);
}

void ignoreSpecialCharacters() {
  test("handles cramped lists", () {
    expect(myWordCounter.countWords("one,two,three"), equals({"one": 1, "two": 1, "three": 1}));
  }, skip: true);
  test("handles expanded lists", () {
    expect(myWordCounter.countWords("one,\ntwo,\nthree"), equals({"one": 1, "two": 1, "three": 1}));
  }, skip: true);
  test("ignore punctuation", () {
    expect(myWordCounter.countWords('car: carpet as java: javascript!!&@\$%^&'),
        equals({"car": 1, "carpet": 1, "as": 1, "java": 1, "javascript": 1}));
  }, skip: true);

  test("with quotations", () {
    expect(myWordCounter.countWords("Joe can't tell between 'large' and large."),
        equals({"joe": 1, "can't": 1, "tell": 1, "between": 1, "large": 2, "and": 1}));
  }, skip: true);
}

void notJustWords() {
  test("include numbers", () {
    expect(myWordCounter.countWords("testing, 1, 2 testing"), equals({"testing": 2, "1": 1, "2": 1}));
  }, skip: true);
}

void edgeCases() {
  test("normalize case", () {
    expect(myWordCounter.countWords("go Go GO Stop stop"), equals({"go": 3, "stop": 2}));
  }, skip: true);
  test("with apostrophes", () {
    expect(myWordCounter.countWords("First: don't laugh. Then: don't cry."),
        equals({"first": 1, "don't": 2, "laugh": 1, "then": 1, "cry": 1}));
  }, skip: true);
}
