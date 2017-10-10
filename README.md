# Exercism Dart Track

![build status](https://travis-ci.org/exercism/dart.svg?branch=master)  [![Gitter](https://badges.gitter.im/exercism/dart.svg)](https://gitter.im/exercism/dart?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Exercism exercises in Dart.

## Setup

The simplest way to install Dart can be [found here](docs/INSTALLATION.md).

## Exercise Tests ##

At the most basic level, Exercism is all about the tests. They drive the user's implementation forward and tell them when the exercise is complete.

The utmost care and attention should be used when adding or making changes to the tests for an exercise. When implementing an exercise test suite, we want to provide a good user experience for the people writing a solution to the exercise. People should not be confused or overwhelmed.

We simulate Test-Driven Development (TDD) by implementing the tests in order of increasing complexity. We try to ensure that each test either

- helps triangulate a solution to be more generic, or
- requires new functionality incrementally.

Test files should use the following format:

```
  test("says hello world with no name", () {
    final String result = helloWorld.hello();
    expect(result, equals("Hello, World!"));
  }, skip: false);
```

## Contributing

Thank you so much for contributing! :tada:

Please read about how to [get involved in a track](https://github.com/exercism/docs/tree/master/contributing-to-language-tracks). Be sure to read the Exercism [Code of Conduct](https://github.com/exercism/exercism.io/blob/master/CODE_OF_CONDUCT.md).

We welcome pull requests of all kinds. No contribution is too small.

We encourage contributions that provide fixes and improvements to existing exercises. Please note that this track's exercises must conform to the standards determined in the [exercism/problem-specifications](https://github.com/exercism/problem-specifications) repo. Changes to the tests or documentation of a common exercise will often warrant a PR in that repo before it can be incorporated into this track's exercises. If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the change.

### Submitting a Pull Request ###

Please keep the following in mind:

- Pull requests should be focused on a single exercise, issue, or change.

- We welcome changes to code style, and wording. Please open a separate PR for these changes if possible.

- Please open an issue before creating a PR that makes significant (breaking) changes to an existing exercise or makes changes across many exercises. It is best to discuss these changes before doing the work. Discussions related to exercises that are not track specific can be found in [exercism/discussions](https://github.com/exercism/discussions/issues).

- Follow the coding standards for Dart.
    * For your convenience, [a link to the Dart style guide](https://www.dartlang.org/guides/language/effective-dart)
    * Some points of interest:
      * [Filename naming convention](https://www.dartlang.org/guides/language/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores)
      * [Guide to the built-in formatter tool](https://github.com/dart-lang/dart_style#getting-dartfmt)

- Watch out for trailing spaces, extra blank lines, and spaces in blank lines.

- All the tests for Dart exercises can be run from the top level of the repo with ... Please run this command before submitting your PR.

### Contributing a New Exercise ###

- All Exercism exercises must be defined in [problem-specifications](https://github.com/exercism/problem-specifications/tree/master/exercises) before they are implemented for a specific track. Please submit a PR there if your exercise is new to Exercism.

- Please make sure the new exercise conforms to specifications in the [exercism/problem-specifications](https://github.com/exercism/problem-specifications) repo.

- Each exercise must stand on its own. Do not reference files outside the exercise directory. They will not be included when the user fetches the exercise.

- Exercises should use only the Dart core libraries.

- Please do not add a README or README.md file to the exercise directory. The READMEs are constructed using shared metadata, which lives in the
[exercism/problem-specifications](https://github.com/exercism/problem-specifications) repository. Further explanation can be found in [fixing-exercise-readmes](https://github.com/exercism/docs/blob/master/language-tracks/exercises/anatomy/readmes.md)

- Each exercise should have a test suite, an example solution, a template file for the real implementation and ... (anything else that needs to go with each exercise for this track).
  - The CI build expects files to be named using the following convention:
     - snake_case_filenames for dart files

- Please do not commit any configuration files or directories inside the exercise other than pubspec.lock and pubspec.yaml

- Be sure to add it to the appropriate place in the `config.json` file. Also, please run `bin/fetch-configlet && bin/configlet lint .` to ensure the exercise is configured correctly.

