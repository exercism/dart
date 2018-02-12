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
    Map<String, int> test = myWordCounter.countWords("word");
    expect(test, equals({"word": 1}));
  }, skip: false);
  test("count one of each word", () {
    Map<String, int> test = myWordCounter.countWords("one of each");
    expect(test, equals({"one": 1, "of": 1, "each": 1}));
  }, skip: true);
  test("multiple occurrences of a word", () {
    Map<String, int> test = myWordCounter.countWords("one fish two fish red fish blue fish");
    expect(test, equals({"one": 1, "fish": 4, "two": 1, "red": 1, "blue": 1}));
  }, skip: true);
}

void ignoreSpecialCharacters() {
  test("handles cramped lists", () {
    Map<String, int> test = myWordCounter.countWords("one,two,three");
    expect(test, equals({"one": 1, "two": 1, "three": 1}));
  }, skip: true);
  test("handles expanded lists", () {
    Map<String, int> test = myWordCounter.countWords("one,\ntwo,\nthree");
    expect(test, equals({"one": 1, "two": 1, "three": 1}));
  }, skip: true);
  test("ignore punctuation", () {
    Map<String, int> test = myWordCounter.countWords('car: carpet as java: javascript!!&@\$%^&');
    expect(test, equals({"car": 1, "carpet": 1, "as": 1, "java": 1, "javascript": 1}));
  }, skip: true);

  test("with quotations", () {
    Map<String, int> test = myWordCounter.countWords("Joe can't tell between 'large' and large.");
    expect(test, equals({"joe": 1, "can't": 1, "tell": 1, "between": 1, "large": 2, "and": 1}));
  }, skip: true);
}

void notJustWords() {
  test("include numbers", () {
    Map<String, int> test = myWordCounter.countWords("testing, 1, 2 testing");
    expect(test, equals({"testing": 2, "1": 1, "2": 1}));
  }, skip: true);
}

void edgeCases() {
  test("normalize case", () {
    Map<String, int> test = myWordCounter.countWords("go Go GO Stop stop");
    expect(test, equals({"go": 3, "stop": 2}));
  }, skip: true);
  test("with apostrophes", () {
    Map<String, int> test = myWordCounter.countWords("First: don't laugh. Then: don't cry.");
    expect(test, equals({"first": 1, "don't": 2, "laugh": 1, "then": 1, "cry": 1}));
  }, skip: true);
  test("multiple spaces not detected as a word", () {
    Map<String, int> test = myWordCounter.countWords("multiple   whitespaces");
    expect(test, equals({"multiple": 1, "whitespaces": 1}));
  }, skip: true);
}
