import 'package:test/test.dart';
import 'package:diamond/diamond.dart';

void main() {
  final diamond = new Diamond();

  group('Diamond', () {
    test("Degenerate case with a single 'A' row", () {
      final List<String> result = diamond.rows("A");
      expect(result, equals(["A"]));
    }, skip: false);

    test("Degenerate case with no row containing 3 distinct groups of spaces", () {
      final List<String> result = diamond.rows("B");
      expect(result, equals([" A ", "B B", " A "]));
    }, skip: false);

    test("Smallest non-degenerate case with odd diamond side length", () {
      final List<String> result = diamond.rows("C");
      expect(result, equals(["  A  ", " B B ", "C   C", " B B ", "  A  "]));
    }, skip: false);

    test("Smallest non-degenerate case with even diamond side length", () {
      final List<String> result = diamond.rows("D");
      expect(result, equals(["   A   ", "  B B  ", " C   C ", "D     D", " C   C ", "  B B  ", "   A   "]));
    }, skip: false);

    test("Largest possible diamond", () {
      final List<String> result = diamond.rows("Z");
      expect(
          result,
          equals([
            "                         A                         ",
            "                        B B                        ",
            "                       C   C                       ",
            "                      D     D                      ",
            "                     E       E                     ",
            "                    F         F                    ",
            "                   G           G                   ",
            "                  H             H                  ",
            "                 I               I                 ",
            "                J                 J                ",
            "               K                   K               ",
            "              L                     L              ",
            "             M                       M             ",
            "            N                         N            ",
            "           O                           O           ",
            "          P                             P          ",
            "         Q                               Q         ",
            "        R                                 R        ",
            "       S                                   S       ",
            "      T                                     T      ",
            "     U                                       U     ",
            "    V                                         V    ",
            "   W                                           W   ",
            "  X                                             X  ",
            " Y                                               Y ",
            "Z                                                 Z",
            " Y                                               Y ",
            "  X                                             X  ",
            "   W                                           W   ",
            "    V                                         V    ",
            "     U                                       U     ",
            "      T                                     T      ",
            "       S                                   S       ",
            "        R                                 R        ",
            "         Q                               Q         ",
            "          P                             P          ",
            "           O                           O           ",
            "            N                         N            ",
            "             M                       M             ",
            "              L                     L              ",
            "               K                   K               ",
            "                J                 J                ",
            "                 I               I                 ",
            "                  H             H                  ",
            "                   G           G                   ",
            "                    F         F                    ",
            "                     E       E                     ",
            "                      D     D                      ",
            "                       C   C                       ",
            "                        B B                        ",
            "                         A                         "
          ]));
    }, skip: false);
  });
}
