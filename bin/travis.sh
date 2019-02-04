#!/bin/bash

set -e

if [ -z "$EXERCISE_DIR" ]; then
  echo -e '\033[31mEXERCISE environment variable must be set!\033[0m'
  exit 1
fi

# Multi commit push
# if ! [[ $TRAVIS_COMMIT_RANGE == '' ]]; then
#   CHANGED_FILES=`git diff --name-only ${TRAVIS_COMMIT_RANGE}`
# else
#  Single commit push
  CHANGED_FILES=`git diff --name-only master...${TRAVIS_COMMIT}`
# fi


SKIP_EXERCISE=True
MD=".md"


for CHANGED_FILE in $CHANGED_FILES; do
  # The changes need to be inside $EXERCISE_DIR
  if [[ $CHANGED_FILE =~ $EXERCISE_DIR ]]; then
    # If it's not a markdown file don't skip
    if ! [[ $CHANGED_FILE =~ $MD ]]; then
      SKIP_EXERCISE=False
    fi 
  fi
done

if [[ $SKIP_EXERCISE == True ]]; then
  echo "Skipping: No changes made to ${EXERCISE_DIR}"
  exit 0
fi



cd "exercises/${EXERCISE_DIR}"
cp -f "lib/example.dart" "lib/${TRAVIS_JOB_NAME}.dart"


echo "Running pub get"
pub get

echo "Running dartanalyzer --fatal-warnings lib test"
dartanalyzer --fatal-warnings lib test

echo "Running dartfmt -l 120 -n"
dartfmt -l 120 -n

echo "Running pub run test --run-skipped"
pub run test --run-skipped
