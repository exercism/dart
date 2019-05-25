import 'package:matching_brackets/matching_brackets.dart';
import 'package:test/test.dart';

void main() {
  final MatchingBrackets matchingBrackets = new MatchingBrackets();
  group('MatchingBrackets', () {
    test("paired square brackets", () {
      final bool result = matchingBrackets.isPaired("[]");
      expect(result, equals(true));
    }, skip: false);

    test("empty string", () {
      final bool result = matchingBrackets.isPaired("");
      expect(result, equals(true));
    }, skip: true);

    test("unpaired brackets", () {
      final bool result = matchingBrackets.isPaired("[[");
      expect(result, equals(false));
    }, skip: true);

    test("wrong ordered brackets", () {
      final bool result = matchingBrackets.isPaired("}{");
      expect(result, equals(false));
    }, skip: true);

    test("wrong closing bracket", () {
      final bool result = matchingBrackets.isPaired("{]");
      expect(result, equals(false));
    }, skip: true);

    test("paired with whitespace", () {
      final bool result = matchingBrackets.isPaired("{ }");
      expect(result, equals(true));
    }, skip: true);

    test("partially paired brackets", () {
      final bool result = matchingBrackets.isPaired("{[])");
      expect(result, equals(false));
    }, skip: true);

    test("simple nested brackets", () {
      final bool result = matchingBrackets.isPaired("{[]}");
      expect(result, equals(true));
    }, skip: true);

    test("several paired brackets", () {
      final bool result = matchingBrackets.isPaired("{}[]");
      expect(result, equals(true));
    }, skip: true);

    test("paired and nested brackets", () {
      final bool result = matchingBrackets.isPaired("([{}({}[])])");
      expect(result, equals(true));
    }, skip: true);

    test("unopened closing brackets", () {
      final bool result = matchingBrackets.isPaired("{[)][]}");
      expect(result, equals(false));
    }, skip: true);

    test("unpaired and nested brackets", () {
      final bool result = matchingBrackets.isPaired("([{])");
      expect(result, equals(false));
    }, skip: true);

    test("paired and wrong nested brackets", () {
      final bool result = matchingBrackets.isPaired("[({]})");
      expect(result, equals(false));
    }, skip: true);

    test("paired and incomplete brackets", () {
      final bool result = matchingBrackets.isPaired("{}[");
      expect(result, equals(false));
    }, skip: true);

    test("too many closing brackets", () {
      final bool result = matchingBrackets.isPaired("[]]");
      expect(result, equals(false));
    }, skip: true);

    test("math expression", () {
      final bool result = matchingBrackets.isPaired("(((185 + 223.85) * 15) - 543)/2");
      expect(result, equals(true));
    }, skip: true);

    test("complex latex expression", () {
      final bool result = matchingBrackets
          .isPaired("\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)");
      expect(result, equals(true));
    }, skip: true);
  });
}
