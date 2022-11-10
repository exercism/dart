import 'package:forth/forth.dart';
import 'package:test/test.dart';

final throwsEmptyStack = throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Stack empty'));
final throwsInvalidDefinition =
    throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Invalid definition'));

void main() {
  group('Forth: parsing and numbers - ', parsingAndNumbers);
  group('Forth: addition - ', addition);
  group('Forth: subtraction - ', subtraction);
  group('Forth: multiplication - ', multiplication);
  group('Forth: division - ', division);
  group('Forth: combined arithmetic - ', combinedArithmetic);
  group('Forth: dup - ', dup);
  group('Forth: drop - ', drop);
  group('Forth: swap - ', swap);
  group('Forth: over - ', over);
  group('Forth: user-defined words - ', userDefinedWords);
  group('Forth: case-insensitivity - ', caseInsensitivity);
}

void parsingAndNumbers() {
  test('numbers just get pushed onto the stack', () {
    var forth = Forth();
    forth.evaluate('1 2 3 4 5');
    expect(forth.stack, equals(<int>[1, 2, 3, 4, 5]));
  }, skip: false);

  test('pushes negative numbers onto the stack', () {
    var forth = Forth();
    forth.evaluate('-1 -2 -3 -4 -5');
    expect(forth.stack, equals(<int>[-1, -2, -3, -4, -5]));
  }, skip: true);
}

void addition() {
  test('can add two numbers', () {
    var forth = Forth();
    forth.evaluate('1 2 +');
    expect(forth.stack, equals(<int>[3]));
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('+'),
      throwsEmptyStack,
    );
  }, skip: true);

  test('errors if there is only one value on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('1 +'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void subtraction() {
  test('can subtract two numbers', () {
    var forth = Forth();
    forth.evaluate('3 4 -');
    expect(forth.stack, equals(<int>[-1]));
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('-'),
      throwsEmptyStack,
    );
  }, skip: true);

  test('errors if there is only one value on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('1 -'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void multiplication() {
  test('can multiply two numbers', () {
    var forth = Forth();
    forth.evaluate('2 4 *');
    expect(forth.stack, equals(<int>[8]));
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('*'),
      throwsEmptyStack,
    );
  }, skip: true);

  test('errors if there is only one value on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('1 *'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void division() {
  test('can divide two numbers', () {
    var forth = Forth();
    forth.evaluate('12 3 /');
    expect(forth.stack, equals(<int>[4]));
  }, skip: true);

  test('performs integer division', () {
    var forth = Forth();
    forth.evaluate('8 3 /');
    expect(forth.stack, equals(<int>[2]));
  }, skip: true);

  test('errors if dividing by zero', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('4 0 /'),
      throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Division by zero')),
    );
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('/'),
      throwsEmptyStack,
    );
  }, skip: true);

  test('errors if there is only one value on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('1 /'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void combinedArithmetic() {
  test('addition and subtraction', () {
    var forth = Forth();
    forth.evaluate('1 2 + 4 -');
    expect(forth.stack, equals(<int>[-1]));
  }, skip: true);

  test('multiplication and division', () {
    var forth = Forth();
    forth.evaluate('2 4 * 3 /');
    expect(forth.stack, equals(<int>[2]));
  }, skip: true);
}

void dup() {
  test('copies a value on the stack', () {
    var forth = Forth();
    forth.evaluate('1 dup');
    expect(forth.stack, equals(<int>[1, 1]));
  }, skip: true);

  test('copies the top value on the stack', () {
    var forth = Forth();
    forth.evaluate('1 2 dup');
    expect(forth.stack, equals(<int>[1, 2, 2]));
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('dup'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void drop() {
  test('removes the top value on the stack if it is the only one', () {
    var forth = Forth();
    forth.evaluate('1 drop');
    expect(forth.stack, equals(<int>[]));
  }, skip: true);

  test('removes the top value on the stack if it is not the only one', () {
    var forth = Forth();
    forth.evaluate('1 2 drop');
    expect(forth.stack, equals(<int>[1]));
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('drop'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void swap() {
  test('swaps the top two values on the stack if they are the only ones', () {
    var forth = Forth();
    forth.evaluate('1 2 swap');
    expect(forth.stack, equals(<int>[2, 1]));
  }, skip: true);

  test('swaps the top two values on the stack if they are not the only ones', () {
    var forth = Forth();
    forth.evaluate('1 2 3 swap');
    expect(forth.stack, equals(<int>[1, 3, 2]));
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('swap'),
      throwsEmptyStack,
    );
  }, skip: true);

  test('errors if there is only one value on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('1 swap'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void over() {
  test('copies the second element if there are only two', () {
    var forth = Forth();
    forth.evaluate('1 2 over');
    expect(forth.stack, equals(<int>[1, 2, 1]));
  }, skip: true);

  test('copies the second element if there are more than two', () {
    var forth = Forth();
    forth.evaluate('1 2 3 over');
    expect(forth.stack, equals(<int>[1, 2, 3, 2]));
  }, skip: true);

  test('errors if there is nothing on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('over'),
      throwsEmptyStack,
    );
  }, skip: true);

  test('errors if there is only one value on the stack', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('1 over'),
      throwsEmptyStack,
    );
  }, skip: true);
}

void userDefinedWords() {
  test('can consist of built-in words', () {
    var forth = Forth();
    forth.evaluate(': dup-twice dup dup ;');
    forth.evaluate('1 dup-twice');
    expect(forth.stack, equals(<int>[1, 1, 1]));
  }, skip: true);

  test('execute in the right order', () {
    var forth = Forth();
    forth.evaluate(': countup 1 2 3 ;');
    forth.evaluate('countup');
    expect(forth.stack, equals(<int>[1, 2, 3]));
  }, skip: true);

  test('can override other user-defined words', () {
    var forth = Forth();
    forth.evaluate(': foo dup ;');
    forth.evaluate(': foo dup dup ;');
    forth.evaluate('1 foo');
    expect(forth.stack, equals(<int>[1, 1, 1]));
  }, skip: true);

  test('can override built-in words', () {
    var forth = Forth();
    forth.evaluate(': swap dup ;');
    forth.evaluate('1 swap');
    expect(forth.stack, equals(<int>[1, 1]));
  }, skip: true);

  test('can override built-in operators', () {
    var forth = Forth();
    forth.evaluate(': + * ;');
    forth.evaluate('3 4 +');
    expect(forth.stack, equals(<int>[12]));
  }, skip: true);

  test('can use different words with the same name', () {
    var forth = Forth();
    forth.evaluate(': foo 5 ;');
    forth.evaluate(': bar foo ;');
    forth.evaluate(': foo 6 ;');
    forth.evaluate('bar foo');
    expect(forth.stack, equals(<int>[5, 6]));
  }, skip: true);

  test('can define word that uses word with the same name', () {
    var forth = Forth();
    forth.evaluate(': foo 10 ;');
    forth.evaluate(': foo foo 1 + ;');
    forth.evaluate('foo');
    expect(forth.stack, equals(<int>[11]));
  }, skip: true);

  test('cannot redefine non-negative numbers', () {
    var forth = Forth();
    expect(
      () => forth.evaluate(': 1 2 ;'),
      throwsInvalidDefinition,
    );
  }, skip: true);

  test('cannot redefine negative numbers', () {
    var forth = Forth();
    expect(
      () => forth.evaluate(': -1 2 ;'),
      throwsInvalidDefinition,
    );
  }, skip: true);

  test('errors if executing a non-existent word', () {
    var forth = Forth();
    expect(
      () => forth.evaluate('foo'),
      throwsA(isA<Exception>().having((e) => e.toString(), 'message', 'Exception: Unknown command')),
    );
  }, skip: true);

  test('only defines locally', () {
    var first = Forth();
    var second = Forth();
    first.evaluate(': + - ;');
    first.evaluate('1 1 +');
    second.evaluate('1 1 +');
    expect(
        [first.stack, second.stack],
        equals(<List<int>>[
          <int>[0],
          <int>[2]
        ]));
  }, skip: true);
}

void caseInsensitivity() {
  test('DUP is case-insensitive', () {
    var forth = Forth();
    forth.evaluate('1 DUP Dup dup');
    expect(forth.stack, equals(<int>[1, 1, 1, 1]));
  }, skip: true);

  test('DROP is case-insensitive', () {
    var forth = Forth();
    forth.evaluate('1 2 3 4 DROP Drop drop');
    expect(forth.stack, equals(<int>[1]));
  }, skip: true);

  test('SWAP is case-insensitive', () {
    var forth = Forth();
    forth.evaluate('1 2 SWAP 3 Swap 4 swap');
    expect(forth.stack, equals(<int>[2, 3, 4, 1]));
  }, skip: true);

  test('OVER is case-insensitive', () {
    var forth = Forth();
    forth.evaluate('1 2 OVER Over over');
    expect(forth.stack, equals(<int>[1, 2, 1, 2, 1]));
  }, skip: true);

  test('user-defined words are case-insensitive', () {
    var forth = Forth();
    forth.evaluate(': foo dup ;');
    forth.evaluate('1 FOO Foo foo');
    expect(forth.stack, equals(<int>[1, 1, 1, 1]));
  }, skip: true);

  test('definitions are case-insensitive', () {
    var forth = Forth();
    forth.evaluate(': SWAP DUP Dup dup ;');
    forth.evaluate('1 swap');
    expect(forth.stack, equals(<int>[1, 1, 1, 1]));
  }, skip: true);
}
