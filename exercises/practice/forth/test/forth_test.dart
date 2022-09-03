import 'package:forth/forth.dart';
import 'package:test/test.dart';

void main() {
  group("Forth", forthTests);
}

void forthTests() {
  final throwsEmptyStack = throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Stack empty'));

  late Forth forth;

  setUp(() => forth = Forth());

  group('parsing and numbers', () {
    test('numbers just get pushed onto the stack', () {
      forth.evaluate('1 2 3 4 5');
      expect(forth.stack, equals([1, 2, 3, 4, 5]));
    });

    test('pushes negative numbers onto the stack', () {
      forth.evaluate('-1 -2 -3 -4 -5');
      expect(forth.stack, equals([-1, -2, -3, -4, -5]));
    });
  });

  group('addition', () {
    test('can add two numbers', () {
      forth.evaluate('1 2 +');
      expect(forth.stack, equals([3]));
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('+'), throwsEmptyStack);
    });

    test('errors if there is only one value on the stack', () {
      expect(() => forth.evaluate('1 +'), throwsEmptyStack);
    });
  });

  group('subtraction', () {
    test('can subtract two numbers', () {
      forth.evaluate('3 4 -');
      expect(forth.stack, equals([-1]));
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('-'), throwsEmptyStack);
    });

    test('errors if there is only one value on the stack', () {
      expect(() => forth.evaluate('1 -'), throwsEmptyStack);
    });
  });

  group('multiplication', () {
    test('can multiply two numbers', () {
      forth.evaluate('2 4 *');
      expect(forth.stack, equals([8]));
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('*'), throwsEmptyStack);
    });

    test('errors if there is only one value on the stack', () {
      expect(() => forth.evaluate('1 *'), throwsEmptyStack);
    });
  });

  group('division', () {
    test('can divide two numbers', () {
      forth.evaluate('12 3 /');
      expect(forth.stack, equals([4]));
    });

    test('performs integer division', () {
      forth.evaluate('8 3 /');
      expect(forth.stack, equals([2]));
    });

    test('errors if dividing by zero', () {
      expect(
        () => forth.evaluate('4 0 /'),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Division by zero')),
      );
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('/'), throwsEmptyStack);
    });

    test('errors if there is only one value on the stack', () {
      expect(() => forth.evaluate('1 /'), throwsEmptyStack);
    });
  });

  group('combined arithmetic', () {
    test('addition and subtraction', () {
      forth.evaluate('1 2 + 4 -');
      expect(forth.stack, equals([-1]));
    });

    test('multiplication and division', () {
      forth.evaluate('2 4 * 3 /');
      expect(forth.stack, equals([2]));
    });
  });

  group('dup', () {
    test('copies a value on the stack', () {
      forth.evaluate('1 dup');
      expect(forth.stack, equals([1, 1]));
    });

    test('copies the top value on the stack', () {
      forth.evaluate('1 2 dup');
      expect(forth.stack, equals([1, 2, 2]));
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('dup'), throwsEmptyStack);
    });
  });

  group('drop', () {
    test('removes the top value on the stack if it is the only one', () {
      forth.evaluate('1 drop');
      expect(forth.stack, equals(<int>[]));
    });

    test('removes the top value on the stack if it is not the only one', () {
      forth.evaluate('1 2 drop');
      expect(forth.stack, equals([1]));
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('drop'), throwsEmptyStack);
    });
  });

  group('swap', () {
    test('swaps the top two values on the stack if they are the only ones', () {
      forth.evaluate('1 2 swap');
      expect(forth.stack, equals([2, 1]));
    });

    test('swaps the top two values on the stack if they are not the only ones', () {
      forth.evaluate('1 2 3 swap');
      expect(forth.stack, equals([1, 3, 2]));
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('swap'), throwsEmptyStack);
    });

    test('errors if there is only one value on the stack', () {
      expect(() => forth.evaluate('1 swap'), throwsEmptyStack);
    });
  });

  group('over', () {
    test('copies the second element if there are only two', () {
      forth.evaluate('1 2 over');
      expect(forth.stack, equals([1, 2, 1]));
    });

    test('copies the second element if there are more than two', () {
      forth.evaluate('1 2 3 over');
      expect(forth.stack, equals([1, 2, 3, 2]));
    });

    test('errors if there is nothing on the stack', () {
      expect(() => forth.evaluate('over'), throwsEmptyStack);
    });

    test('errors if there is only one value on the stack', () {
      expect(() => forth.evaluate('1 over'), throwsEmptyStack);
    });
  });

  group('user-defined words', () {
    test('can consist of built-in words', () {
      forth.evaluate(': dup-twice dup dup ;');
      forth.evaluate('1 dup-twice');
      expect(forth.stack, equals([1, 1, 1]));
    });

    test('execute in the right order', () {
      forth.evaluate(': countup 1 2 3 ;');
      forth.evaluate('countup');
      expect(forth.stack, equals([1, 2, 3]));
    });

    test('can override other user-defined words', () {
      forth.evaluate(': foo dup ;');
      forth.evaluate(': foo dup dup ;');
      forth.evaluate('1 foo');
      expect(forth.stack, equals([1, 1, 1]));
    });

    test('can override built-in words', () {
      forth.evaluate(': swap dup ;');
      forth.evaluate('1 swap');
      expect(forth.stack, equals([1, 1]));
    });

    test('can override built-in operators', () {
      forth.evaluate(': + * ;');
      forth.evaluate('3 4 +');
      expect(forth.stack, equals([12]));
    });

    test('can use different words with the same name', () {
      forth.evaluate(': foo 5 ;');
      forth.evaluate(': bar foo ;');
      forth.evaluate(': foo 6 ;');
      forth.evaluate('bar foo');
      expect(forth.stack, equals([5, 6]));
    });

    test('can define word that uses word with the same name', () {
      forth.evaluate(': foo 10 ;');
      forth.evaluate(': foo foo 1 + ;');
      forth.evaluate('foo');
      expect(forth.stack, equals([11]));
    });

    test('cannot redefine numbers', () {
      expect(
        () => forth.evaluate(': 1 2 ;'),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Invalid definition')),
      );
    });

    test('cannot redefine negative numbers', () {
      expect(
        () => forth.evaluate(': -1 2 ;'),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Invalid definition')),
      );
    });

    test('errors if executing a non-existent word', () {
      expect(
        () => forth.evaluate('foo'),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Unknown command')),
      );
    });

    test('only defines locally', () {
      final first = Forth();
      final second = Forth();
      first.evaluate(': + - ;');
      first.evaluate('1 1 +');
      second.evaluate('1 1 +');
      expect(first.stack, equals([0]));
      expect(second.stack, equals([2]));
    });
  });

  group('case-insensitivity', () {
    test('DUP is case-insensitive', () {
      forth.evaluate('1 DUP Dup dup');
      expect(forth.stack, equals([1, 1, 1, 1]));
    });

    test('DROP is case-insensitive', () {
      forth.evaluate('1 2 3 4 DROP Drop drop');
      expect(forth.stack, equals([1]));
    });

    test('SWAP is case-insensitive', () {
      forth.evaluate('1 2 SWAP 3 Swap 4 swap');
      expect(forth.stack, equals([2, 3, 4, 1]));
    });

    test('OVER is case-insensitive', () {
      forth.evaluate('1 2 OVER Over over');
      expect(forth.stack, equals([1, 2, 1, 2, 1]));
    });

    test('user-defined words are case-insensitive', () {
      forth.evaluate(': foo dup ;');
      forth.evaluate('1 FOO Foo foo');
      expect(forth.stack, equals([1, 1, 1, 1]));
    });

    test('definitions are case-insensitive', () {
      forth.evaluate(': SWAP DUP Dup dup ;');
      forth.evaluate('1 swap');
      expect(forth.stack, equals([1, 1, 1, 1]));
    });
  });
}
