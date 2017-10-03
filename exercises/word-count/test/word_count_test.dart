import 'package:test/test.dart';
import 'package:word_count/word_count.dart';

void main() {
  final mywordcounter = new WordCount();
  group("WordCount", () {
    test("count one word", () {
      expect(mywordcounter.countWords("word"), equals({"word": 1}));
    });
    test("count one of each word", () {
      expect(mywordcounter.countWords("one of each"),
          equals({"one": 1, "of": 1, "each": 1}));
    });
    test("multiple occurrences of a word", () {
      expect(mywordcounter.countWords("one fish two fish red fish blue fish"),
          equals({"one": 1, "fish": 4, "two": 1, "red": 1, "blue": 1}));
    });
    test("handles cramped lists", () {
      expect(mywordcounter.countWords("one,two,three"),
          equals({"one": 1, "two": 1, "three": 1}));
    });
    test("handles expanded lists", () {
      expect(mywordcounter.countWords("one,\ntwo,\nthree"),
          equals({"one": 1, "two": 1, "three": 1}));
    });
    test("ignore punctuation", () {
      expect(
          mywordcounter.countWords('car: carpet as java: javascript!!&@\$%^&'),
          equals({"car": 1, "carpet": 1, "as": 1, "java": 1, "javascript": 1}));
    });
    test("include numbers", () {
      expect(mywordcounter.countWords("testing, 1, 2 testing"),
          equals({"testing": 2, "1": 1, "2": 1}));
    });
    test("normalize case", () {
      expect(mywordcounter.countWords("go Go GO Stop stop"),
          equals({"go": 3, "stop": 2}));
    });
    test("with apostrophes", () {
      expect(mywordcounter.countWords("First: don't laugh. Then: don't cry."),
          equals({"first": 1, "don't": 2, "laugh": 1, "then": 1, "cry": 1}));
    });
    test("with quotations", () {
      expect(
          mywordcounter.countWords("Joe can't tell between 'large' and large."),
          equals({
            "joe": 1,
            "can't": 1,
            "tell": 1,
            "between": 1,
            "large": 2,
            "and": 1
          }));
    });
  });
}
