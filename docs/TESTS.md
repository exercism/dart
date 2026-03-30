# Running the Tests

## Download an Exercise

Use the [Exercism CLI][cli] to download the exercise you want to work on.

```sh
exercism download --track=dart --exercise=hello-world
```

Then change into the exercise directory.

```sh
cd /path/to/exercism/dart/hello-world
```

## Install Dependencies

Before running the tests, download the exercise dependencies.

```sh
dart pub get
```

## Run the Tests

```sh
dart test
```

## Understanding Test Results

`dart test` uses the compact reporter by default, showing a running count of tests passed, skipped, and failed on a single line.

```sh
$ dart test
00:00 +1 -1: test/binary_search_test.dart: finds a value in the middle of an array [E]
  Expected: <3>
    Actual: <0>

  package:matcher                    expect
  test/binary_search_test.dart 13:5  main.<fn>


To run this test again: dart test test/binary_search_test.dart -p vm --plain-name 'finds a value in the middle of an array'
00:00 +1 ~9 -1: Some tests failed.
```

- `+1` — 1 test passed
- `~9` — 9 tests skipped
- `-1` — 1 test failed

For more detailed per-test output, use the expanded reporter, which shows each test result as it runs.

```sh
$ dart test -r expanded
00:00 +0: loading test/binary_search_test.dart
00:00 +0: test/binary_search_test.dart: finds a value in an array with one element
00:00 +1: test/binary_search_test.dart: finds a value in the middle of an array
00:00 +1 -1: test/binary_search_test.dart: finds a value in the middle of an array [E]
  Expected: <3>
    Actual: <0>
  
  package:matcher                    expect
  test/binary_search_test.dart 13:5  main.<fn>
  
00:00 +1 -1: test/binary_search_test.dart: finds a value at the beginning of an array
00:00 +1 ~1 -1: test/binary_search_test.dart: finds a value at the end of an array
00:00 +1 ~2 -1: test/binary_search_test.dart: finds a value in an array of odd length
00:00 +1 ~3 -1: test/binary_search_test.dart: finds a value in an array of even length
00:00 +1 ~4 -1: test/binary_search_test.dart: identifies that a value is not included in the array
00:00 +1 ~5 -1: test/binary_search_test.dart: a value smaller than the array's smallest value is not found
00:00 +1 ~6 -1: test/binary_search_test.dart: a value larger than the array's largest value is not found
00:00 +1 ~7 -1: test/binary_search_test.dart: nothing is found in an empty array
00:00 +1 ~8 -1: test/binary_search_test.dart: nothing is found when the left and right bounds cross
00:00 +1 ~9 -1: Some tests failed.
```

## Working Through Tests

Most exercises have multiple tests, with all but the first skipped by default.

```dart
void main() {
  final twoFer = TwoFer();

  group('TwoFer', () {
    test('no name given', () {
      final result = twoFer.statement();
      expect(result, equals('One for you, one for me.'));
    }, skip: false);

    test('a name given', () {
      final result = twoFer.statement('Alice');
      expect(result, equals('One for Alice, one for me.'));
    }, skip: true);

    test('another name given', () {
      final result = twoFer.statement('Bob');
      expect(result, equals('One for Bob, one for me.'));
    }, skip: true);
  });
}
```

To work through tests one at a time, change `skip: true` to `skip: false` on each test as you go.
Alternatively, run all tests at once without editing the file.

```sh
dart test --run-skipped
```

All tests are run by the online test runner on submission, including skipped ones.

[cli]: https://exercism.org/docs/using/solving-exercises/working-locally
