# Exercism Dart Track

![build status](https://travis-ci.org/exercism/dart.svg?branch=master)  [![Gitter](https://badges.gitter.im/exercism/dart.svg)](https://gitter.im/exercism/dart?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Exercism exercises in Dart.

## Requirements

* Dart 2.0.0 or higher

## Setup

The simplest way to install Dart can be [found here](docs/INSTALLATION.md).

Clone the repo and run `pub get` to download all the dependencies for this project.

To run all the tests execute: `pub run test`

To create a new exercise, use the executable in the tool directory: `dart bin/create_exercise.dart`

## Exercise Tests

At the most basic level, Exercism is all about the tests. They drive the user's implementation forward and tell them when the exercise is complete.

The utmost care and attention should be used when adding or making changes to the tests for an exercise. When implementing an exercise test suite, we want to provide a good user experience for the people writing a solution to the exercise. People should not be confused or overwhelmed.

We simulate Test-Driven Development (TDD) by implementing the tests in order of increasing complexity. We try to ensure that each test either

- helps triangulate a solution to be more generic, or
- requires new functionality incrementally.

Test files should use the following format:

```dart
  test("says hello world with no name", () {
    final String result = helloWorld.hello();
    expect(result, equals("Hello, World!"));
  }, skip: false);
```

## Contributing

Thank you so much for contributing! :tada:

We welcome pull requests of all kinds. No contribution is too small.

We encourage contributions that provide fixes and improvements to existing exercises. Please note that this track's exercises must conform to the standards determined in the [exercism/problem-specifications](https://github.com/exercism/problem-specifications) repo. Changes to the tests or documentation of a common exercise will often warrant a PR in that repo before it can be incorporated into this track's exercises. If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the change.

Please read our [Contribution guidelines](CONTRIBUTING.md) on how to help this track!
