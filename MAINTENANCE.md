# Generate exercise tests

Use `bin/create_exercise.dart` to create or regenerate existing test suites for practice exercises.
This generator builds each test suite from the exercise’s canonical data in Exercism’s problem-specifications repository.

## Set up

From this repo's root, install the generator's Dart dependencies:

```sh
dart pub get
```

The generator also expects `bin/configlet` to be available.

Fetch configlet if needed:

```sh
bin/fetch-configlet
```

Finally, the generator requires a local copy of Exercism's `problem-specifications` repo.
Make sure this copy is up-to-date before running the generator.

```sh
git clone https://github.com/exercism/problem-specifications.git ../problem-specifications
```

## Generate tests

Run the generator from the track repo root, passing the path to `problem-specifications` and an exercise slug.

```sh
dart run bin/create_exercise.dart --spec-path ../problem-specifications anagram
```

If `exercises/practice/<slug>` already exists, the generator first runs `configlet sync`, syncing the exercise's existing documents and metadata.
Otherwise, it runs `configlet create` to create these files.
In both scenarios, the generator then fills in the exercise’s test suite and installs the exercise's dependencies for your local testing.

A successful run for an existing exercise should include output like this:

```text
Found: ../problem-specifications/exercises/anagram/canonical-data.json
Successfully synced via configlet.
Successfully created a rough-draft of tests at 'exercises/practice/anagram/test/anagram_test.dart'.
You should check this over and fix or refine as necessary.
```


## Review and test

Alongside the files created by `configlet`, the generator fills in the exercise test suite, `analysis_options.yaml`, and `pubspec.yaml` every time.
The student solution at `lib/<snake_case_slug>.dart` and example solution at `.meta/lib/example.dart` are only generated when an exercise is created for the first time.
When regenerating an existing exercise, those files are not touched.
The example solution must be updated to pass the repo's CI test workflow, indicating the test suite is solvable.

However, it's likely that the generated test suite will need to be updated first.
The tests will use canonical descriptions, properties, inputs, and expected values.
The first included test is enabled, and later tests are skipped.
Check the method names, arguments, expected values, and groupings of tests make sense and are valid for the exercise being implemented.
For example, Armstrong Numbers canonically takes a numeric argument, but on this track, we use a stringified number.
After regenerating the test suite, that argument will become a number instead of a string.
Changing the argument type might break student solutions so we'd want to keep the argument type as a string here.

During the reviw process, we may need to exclude canonical cases that are not a good fit for Dart or the existing exercise setup.
`.meta/tests.toml` stores information about which test cases are included or not.
For existing exercises, the generator tracks whether cases have previously been excluded here.
To exclude a case, put an `include = false` line directly underneath the case's description:

```toml
[12ffbf10-307a-434e-b4ad-c925680e1dd4]
description = "The largest and last Armstrong number"
include = false
```

Once you're done excluding tests, rerun the generator.
Note you'll need to restore any track-specific tests or helpers replaced by the regeneration.

Once the test suite is finalized, run the exercise's tests against the example solution.
You'll also want to check the formatting for all Dart source code.

```sh
EXERCISE=armstrong-numbers dart test test/exercises_test.dart
dart run bin/check_formatting.dart
```

Review any warnings or errors from `configlet` and the formatting run.
At this point, you should be ready for a maintainer to review your work.
