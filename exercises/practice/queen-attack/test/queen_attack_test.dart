import 'package:queen_attack/queen_attack.dart';
import 'package:test/test.dart';

void main() {
  group('Queen Attack', () {
    group('Test creation of Queens with valid and invalid positions', () {
      test('Queens with a valid position', () {
        expect(() => Queen(2, 2), returnsNormally);
      }, skip: false);

      test('Queens must have positive row value', () {
        expect(
            () => Queen(-2, 2),
            throwsA(
              predicate((e) => e is AssertionError && e.message == 'row not positive'),
            ));
      }, skip: true);

      test('Queens must have row value on board', () {
        expect(
            () => Queen(8, 4),
            throwsA(
              predicate((e) => e is AssertionError && e.message == 'row not on board'),
            ));
      }, skip: true);

      test('Queens must have positive column value', () {
        expect(
            () => Queen(2, -2),
            throwsA(
              predicate((e) => e is AssertionError && e.message == 'column not positive'),
            ));
      }, skip: true);

      test('Queens must have column value on board', () {
        expect(
            () => Queen(4, 8),
            throwsA(
              predicate((e) => e is AssertionError && e.message == 'column not on board'),
            ));
      }, skip: true);
    });

    group('Test the ability of one queen to attack another', () {
      test('cannot attack', () {
        final Queen white = Queen(2, 4);
        final Queen black = Queen(6, 6);

        expect(white.canAttack(black), isFalse);
      }, skip: true);

      test('can attack on same row', () {
        final Queen white = Queen(2, 4);
        final Queen black = Queen(2, 6);

        expect(white.canAttack(black), isTrue);
      }, skip: true);

      test('can attack on same column', () {
        final Queen white = Queen(4, 5);
        final Queen black = Queen(2, 5);

        expect(white.canAttack(black), isTrue);
      }, skip: true);

      test('can attack on first diagonal', () {
        final Queen white = Queen(2, 2);
        final Queen black = Queen(0, 4);

        expect(white.canAttack(black), isTrue);
      }, skip: true);

      test('can attack on second diagonal', () {
        final Queen white = Queen(2, 2);
        final Queen black = Queen(3, 1);

        expect(white.canAttack(black), isTrue);
      }, skip: true);

      test('can attack on third diagonal', () {
        final Queen white = Queen(2, 2);
        final Queen black = Queen(1, 1);

        expect(white.canAttack(black), isTrue);
      }, skip: true);

      test('can attack on fourth diagonal', () {
        final Queen white = Queen(1, 7);
        final Queen black = Queen(0, 6);

        expect(white.canAttack(black), isTrue);
      }, skip: true);

      test('cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal',
          () {
        final Queen white = Queen(4, 1);
        final Queen black = Queen(2, 5);

        expect(white.canAttack(black), isFalse);
      }, skip: true);
    });
  });
}
