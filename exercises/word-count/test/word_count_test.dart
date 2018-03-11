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
    final Map<String, int> result = myWordCounter.countWords("word");
    expect(result, equals({"word": 1}));
  }, skip: false);

  test("count one of each word", () {
    final Map<String, int> result = myWordCounter.countWords("one of each");
    expect(result, equals({"one": 1, "of": 1, "each": 1}));
  }, skip: true);

  test("multiple occurrences of a word", () {
    final Map<String, int> result = myWordCounter.countWords("one fish two fish red fish blue fish");
    expect(result, equals({"one": 1, "fish": 4, "two": 1, "red": 1, "blue": 1}));
  }, skip: true);
}

void ignoreSpecialCharacters() {
  test("handles cramped lists", () {
    final Map<String, int> result = myWordCounter.countWords("one,two,three");
    expect(result, equals({"one": 1, "two": 1, "three": 1}));
  }, skip: true);

  test("handles expanded lists", () {
    final Map<String, int> result = myWordCounter.countWords("one,\ntwo,\nthree");
    expect(result, equals({"one": 1, "two": 1, "three": 1}));
  }, skip: true);

  test("ignore punctuation", () {
    final Map<String, int> result = myWordCounter.countWords("car: carpet as java: javascript!!&@\$%^&");
    expect(result, equals({"car": 1, "carpet": 1, "as": 1, "java": 1, "javascript": 1}));
  }, skip: true);

  test("with quotations", () {
    final Map<String, int> result = myWordCounter.countWords("Joe can't tell between 'large' and large.");
    expect(result, equals({"joe": 1, "can't": 1, "tell": 1, "between": 1, "large": 2, "and": 1}));
  }, skip: true);
}

void notJustWords() {
  test("include numbers", () {
    final Map<String, int> result = myWordCounter.countWords("testing, 1, 2 testing");
    expect(result, equals({"testing": 2, "1": 1, "2": 1}));
  }, skip: true);
}

void edgeCases() {
  test("normalize case", () {
    final Map<String, int> result = myWordCounter.countWords("go Go GO Stop stop");
    expect(result, equals({"go": 3, "stop": 2}));
  }, skip: true);

  test("with apostrophes", () {
    final Map<String, int> result = myWordCounter.countWords("First: don't laugh. Then: don't cry.");
    expect(result, equals({"first": 1, "don't": 2, "laugh": 1, "then": 1, "cry": 1}));
  }, skip: true);

  test("multiple spaces not detected as a word", () {
    final Map<String, int> result = myWordCounter.countWords(" multiple   whitespaces");
    expect(result, equals({"multiple": 1, "whitespaces": 1}));
  }, skip: true);
}
