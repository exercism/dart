# Tests

Install dependencies.

```sh
dart pub get
```

Run the tests.

```sh
dart test
```

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
As tests pass, enable the next test by changing `skip: true` to `skip: false` (or removing the `skip` parameter entirely).
Once all tests pass locally, submit your solution.
Note: all tests will be run by the online test runner on every submission.
