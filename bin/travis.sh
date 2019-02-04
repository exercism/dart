#!/bin/bash

set -e

if [ -z "$EXERCISE_DIR" ]; then
  echo -e '\033[31mEXERCISE environment variable must be set!\033[0m'
  exit 1
fi


if [ -z "$TRAVIS_JOB_NAME" ]; then
  echo -e '\033[31mTRAVIS_JOB_NAME environment variable must be set!\033[0m'
  exit 1
fi


CHANGED_FILES=`git diff --name-only master...$TRAVIS_COMMIT`

SKIP_EXERCISE=true
MD=".md"


for CHANGED_FILE in $CHANGED_FILES; do
  # The changes need to be inside $EXERCISE_DIR
  if [[ $CHANGED_FILE =~ $EXERCISE_DIR ]]; then
    # If it's not a markdown file don't skip
    if ! [[ $CHANGED_FILE =~ $MD ]]; then
      SKIP_EXERCISE=false
      # No need to loop any further
      break;
    fi 
  fi
done


if $SKIP_EXERCISE; then
  echo "Skipping: No changes made to $EXERCISE_DIR"
  exit 0
fi


cd "exercises/$EXERCISE_DIR"
cp -f "lib/example.dart" "lib/$TRAVIS_JOB_NAME.dart"

echo "Running pub get"
pub get

echo "Running dartanalyzer --fatal-warnings lib test"
dartanalyzer --fatal-warnings lib test

echo "Running dartfmt -l 120 -n --set-exit-if-changed ."
dartfmt -l 120 -n --set-exit-if-changed .

echo "Running pub run test --run-skipped"
pub run test --run-skipped
