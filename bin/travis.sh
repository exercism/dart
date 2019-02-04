#!/bin/bash

set -e

if [ -z "$EXERCISE_DIR" ]; then
  echo -e '\033[31mEXERCISE environment variable must be set!\033[0m'
  exit 1
fi

# Multi commit push
if ! [[ $TRAVIS_COMMIT_RANGE == '' ]]; then
  CHANGED_FILES=`git diff --name-only ${TRAVIS_COMMIT_RANGE}`
else
#  Single commit push
  CHANGED_FILES=`git diff --name-only master...${TRAVIS_COMMIT}`
fi


ONLY_DOCS=True
SKIP_EXERCISE=True
MD=".md"


for CHANGED_FILE in $CHANGED_FILES; do
  if ! [[ $CHANGED_FILE =~ $MD ]]; then
    ONLY_DOCS=False
    break
  fi
  if ![[ $CHANGED_FILES =~ $EXERCISE_DIR ]]; then
    SKIP_EXERCISE=false
    break
  fi
done

if [[ $ONLY_DOCS == True ]]; then
  echo "Skipping: Only doc files changed"
  exit 0
fi

if [[ $SKIP_EXERCISE == True ]]; then
  echo "Skipping: No changes made to ${SKIP_EXERCISE}"
  exit 0
fi



cd "exercises/${EXERCISE}"
cp -f "lib/example.dart" "lib/${TRAVIS_JOB_NAME}.dart"

pub get

dartanalyzer --fatal-warnings lib

dartfmt -l 120 -n

pub run test --run-skipped
