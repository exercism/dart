import 'package:diamond/diamond.dart';
import 'package:test/test.dart';

void main() {
  final diamond = Diamond();

  group('Diamond', () {
    test('Degenerate case with a single \'A\' row', () {
      final result = diamond.rows('A');
      expect(
          result,
          equals(<String>[
            'A',
          ]));
    }, skip: false);

    test('Degenerate case with no row containing 3 distinct groups of spaces', () {
      final result = diamond.rows('B');
      expect(
          result,
          equals(<String>[
            ' A ',
            'B B',
            ' A ',
          ]));
    }, skip: true);

    test('Smallest non-degenerate case with odd diamond side length', () {
      final result = diamond.rows('C');
      expect(
          result,
          equals(<String>[
            '  A  ',
            ' B B ',
            'C   C',
            ' B B ',
            '  A  ',
          ]));
    }, skip: true);

    test('Smallest non-degenerate case with even diamond side length', () {
      final result = diamond.rows('D');
      expect(
          result,
          equals(<String>[
            '   A   ',
            '  B B  ',
            ' C   C ',
            'D     D',
            ' C   C ',
            '  B B  ',
            '   A   ',
          ]));
    }, skip: true);

    test('Largest possible diamond', () {
      final result = diamond.rows('Z');
      expect(
          result,
          equals(<String>[
            '                         A                         ',
            '                        B B                        ',
            '                       C   C                       ',
            '                      D     D                      ',
            '                     E       E                     ',
            '                    F         F                    ',
            '                   G           G                   ',
            '                  H             H                  ',
            '                 I               I                 ',
            '                J                 J                ',
            '               K                   K               ',
            '              L                     L              ',
            '             M                       M             ',
            '            N                         N            ',
            '           O                           O           ',
            '          P                             P          ',
            '         Q                               Q         ',
            '        R                                 R        ',
            '       S                                   S       ',
            '      T                                     T      ',
            '     U                                       U     ',
            '    V                                         V    ',
            '   W                                           W   ',
            '  X                                             X  ',
            ' Y                                               Y ',
            'Z                                                 Z',
            ' Y                                               Y ',
            '  X                                             X  ',
            '   W                                           W   ',
            '    V                                         V    ',
            '     U                                       U     ',
            '      T                                     T      ',
            '       S                                   S       ',
            '        R                                 R        ',
            '         Q                               Q         ',
            '          P                             P          ',
            '           O                           O           ',
            '            N                         N            ',
            '             M                       M             ',
            '              L                     L              ',
            '               K                   K               ',
            '                J                 J                ',
            '                 I               I                 ',
            '                  H             H                  ',
            '                   G           G                   ',
            '                    F         F                    ',
            '                     E       E                     ',
            '                      D     D                      ',
            '                       C   C                       ',
            '                        B B                        ',
            '                         A                         ',
          ]));
    }, skip: true);
  });
}
