# Contributing

Thank you so much for contributing! :tada:

Please read about how to [get involved in a track](https://exercism.org/docs/building). Be sure to read the Exercism [Code of Conduct](https://exercism.io/code-of-conduct).

We welcome pull requests of all kinds. No contribution is too small.

We encourage contributions that provide fixes and improvements to existing exercises. Please note that this track's exercises must conform to the standards determined in the [exercism/problem-specifications](https://github.com/exercism/problem-specifications) repo. Changes to the tests or documentation of a common exercise will often warrant a PR in that repo before it can be incorporated into this track's exercises. If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the change.

## Submitting a Pull Request ###

Please keep the following in mind:

- Pull requests should be focused on a single exercise, issue, or change.

- We welcome changes to code style, and wording. Please open a separate PR for these changes if possible.

- Please open an issue before creating a PR that makes significant (breaking) changes to an existing exercise or makes changes across many exercises. It is best to discuss these changes before doing the work. Discussions related to exercises that are not track specific can be found in [exercism/discussions](https://github.com/exercism/discussions/issues).

- Follow the coding standards for Dart.
    * For your convenience, [a link to the Dart style guide](https://www.dart.dev/guides/language/effective-dart)
    * Some points of interest:
      * [Filename naming convention](https://www.dart.dev/guides/language/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores)
      * [Guide to the built-in formatter tool](https://github.com/dart-lang/dart_style#getting-dartfmt)

- When contributing code, watch out for:
    * Trailing spaces, extra blank lines, and spaces in blank lines.
    * Misspelled words or unclear sentences
    * Offensive words or phrases
    * Sensitive information (email address, real names, etc)

- Please run the following commands before submitting your PR:
    * `dart run bin/check_formatting.dart` - Checks the config.json and all Dart files for formatting issues
    * `dart run bin/presubmit.dart` - Runs the test for Dart exercises, and formats config.json and all Dart files

- Once a Pull Request is approved, the contributing branch will be rebased onto the latest version of our master branch.

## Contributing a New Exercise ###

- All Exercism exercises must be defined in [problem-specifications](https://github.com/exercism/problem-specifications/tree/master/exercises) before they are implemented for a specific track. If your exercise is new, please submit a PR to [exercism/problem-specification](https://github.com/exercism/problem-specifications).

- Please make sure the new exercise conforms to specifications in the [exercism/problem-specifications](https://github.com/exercism/problem-specifications) repo.
  - Run `bin/fetch-configlet` to download configlet.
  - Use `bin/configlet sync --exercise <slug-name-for-new-exercise> --check` to see if any test cases are missing.
    - Example `./bin/configlet sync --exercise armstrong-numbers --check`

- Each exercise must stand on its own. Do not reference files outside the exercise directory. They will not be included when the user fetches the exercise.

- Exercises should use only the Dart core libraries.

- Please do not add a README or README.md file to the exercise directory. The READMEs are generated using shared metadata, which lives in the
[exercism/problem-specifications](https://github.com/exercism/problem-specifications) repository.
  - Read the [Generating a README](https://github.com/exercism/docs/blob/master/language-tracks/exercises/anatomy/readmes.md) sections Setup and Generation to see the necessary steps.

- Each exercise should have a test suite, an example solution, a template file for the real implementation, and a README.md
  - The CI build expects Dart files to be named in the convention of snake_case_filenames

- Please do not commit any configuration files or directories inside the exercise other than pubspec.yaml, .meta/tests.toml, and analysis_options.yaml.

- Be sure to add the new exercise to the appropriate place in the `config.json` file.

- Please run `bin/fetch-configlet && bin/configlet lint --track-id=dart .` to configure the exercise correctly.
