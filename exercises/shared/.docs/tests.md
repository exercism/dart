# Tests

Install dependencies.

```sh
dart pub get
```

Run the tests.

```sh
dart test
```

For more detailed per-test output, use the expanded reporter.

```sh
dart test -r expanded
```

Most exercises have multiple tests, with all but the first skipped by default.
To work through tests one at a time, change `skip: true` to `skip: false` on each test as you go.

Alternatively, run all tests at once without editing the file.

```sh
dart test --run-skipped
```

All tests are run by the online test runner on submission, including skipped ones.
