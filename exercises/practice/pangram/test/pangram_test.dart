import 'package:pangram/pangram.dart';
import 'package:test/test.dart';

void main() {
  final pangram = new Pangram();

  group('Pangram', () {
    group('Check if the given string is a pangram', () {
      test("sentence empty", () {
        final bool result = pangram.isPangram("");
        expect(result, equals(false));
      }, skip: false);

      test("recognizes a perfect lower case pangram", () {
        final bool result = pangram.isPangram("abcdefghijklmnopqrstuvwxyz");
        expect(result, equals(true));
      }, skip: true);

      test("pangram with only lower case", () {
        final bool result = pangram.isPangram("the quick brown fox jumps over the lazy dog");
        expect(result, equals(true));
      }, skip: true);

      test("missing character 'x'", () {
        final bool result = pangram.isPangram("a quick movement of the enemy will jeopardize five gunboats");
        expect(result, equals(false));
      }, skip: true);

      test("another missing character, e.g. 'h'", () {
        final bool result = pangram.isPangram("five boxing wizards jump quickly at it");
        expect(result, equals(false));
      }, skip: true);

      test("pangram with underscores", () {
        final bool result = pangram.isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog");
        expect(result, equals(true));
      }, skip: true);

      test("pangram with numbers", () {
        final bool result = pangram.isPangram("the 1 quick brown fox jumps over the 2 lazy dogs");
        expect(result, equals(true));
      }, skip: true);

      test("missing letters replaced by numbers", () {
        final bool result = pangram.isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog");
        expect(result, equals(false));
      }, skip: true);

      test("pangram with mixed case and punctuation", () {
        final bool result = pangram.isPangram("\"Five quacking Zephyrs jolt my wax bed.\"");
        expect(result, equals(true));
      }, skip: true);

      test("upper and lower case versions of the same character should not be counted separately", () {
        final bool result = pangram.isPangram("the quick brown fox jumps over with lazy FX");
        expect(result, equals(false));
      }, skip: true);
    });
  });
}
