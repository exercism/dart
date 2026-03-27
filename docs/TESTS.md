# Running the Tests

## Download an Exercise

Use the [Exercism CLI][cli] to download the exercise you want to work on.

```shell
exercism download --track=dart --exercise=hello-world
```

Then change into the exercise directory.

```shell
cd /path/to/exercism/dart/hello-world
```

## Install Dependencies

Before running the tests, download the exercise dependencies.

```shell
dart pub get
```

## Run the Tests

Now, run the tests and see the test results.
```shell
dart test
```

## Understanding Test Results

The test run summary lists the number of tests passed, skipped, and failed.
For example:

```
❯ dart test
00:01 +0 ~2 -1: Some tests failed.
```

- `+0` — 0 tests passed
- `~2` — 2 tests skipped
- `-1` — 1 test failed

Most exercises will have multiple tests where all but the first are skipped by default.
Here's what a typical test file looks like:

```dart
group('TwoFer', () {
  test('no name given', () {
    final result = twoFer();
    expect(result, equals('One for you, one for me.'));
  }, skip: false);

  test('a name given', () {
    final result = twoFer('Alice');
    expect(result, equals('One for Alice, one for me.'));
  }, skip: true);

  test('another name given', () {
    final result = twoFer('Bob');
    expect(result, equals('One for Bob, one for me.'));
  }, skip: true);
});
```

As tests pass, enable the next test by changing `skip: true` to `skip: false` (or removing the `skip` parameter entirely).
Once all tests pass locally, submit your solution.
Note: all tests will be run by the online test runner on every submission.

[cli]: https://exercism.org/docs/using/solving-exercises/working-locally
