import 'package:two_bucket/two_bucket.dart';
import 'package:test/test.dart';

void main() {
  test("Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one", () {
    final game = TwoBucket(bucketOne: 3, bucketTwo: 5, goal: 1, startBucket: "one");
    expect(game.measure(), equals((moves: 4, goalBucket: "one", otherBucket: 5)));
  }, skip: false);

  test("Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two", () {
    final game = TwoBucket(bucketOne: 3, bucketTwo: 5, goal: 1, startBucket: "two");
    expect(game.measure(), equals((moves: 8, goalBucket: "two", otherBucket: 3)));
  }, skip: true);

  test("Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one", () {
    final game = TwoBucket(bucketOne: 7, bucketTwo: 11, goal: 2, startBucket: "one");
    expect(game.measure(), equals((moves: 14, goalBucket: "one", otherBucket: 11)));
  }, skip: true);

  test("Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two", () {
    final game = TwoBucket(bucketOne: 7, bucketTwo: 11, goal: 2, startBucket: "two");
    expect(game.measure(), equals((moves: 18, goalBucket: "two", otherBucket: 7)));
  }, skip: true);

  test("Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two", () {
    final game = TwoBucket(bucketOne: 1, bucketTwo: 3, goal: 3, startBucket: "two");
    expect(game.measure(), equals((moves: 1, goalBucket: "two", otherBucket: 0)));
  }, skip: true);

  test("Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two",
      () {
    final game = TwoBucket(bucketOne: 2, bucketTwo: 3, goal: 3, startBucket: "one");
    expect(game.measure(), equals((moves: 2, goalBucket: "two", otherBucket: 2)));
  }, skip: true);

  test("Not possible to reach the goal", () {
    final game = TwoBucket(bucketOne: 6, bucketTwo: 15, goal: 5, startBucket: "one");
    expect(() => game.measure(),
        throwsA(isA<ArgumentError>().having((e) => e.toString(), 'message', contains('impossible'))));
  }, skip: true);

  test("With the same buckets but a different goal, then it is possible", () {
    final game = TwoBucket(bucketOne: 6, bucketTwo: 15, goal: 9, startBucket: "one");
    expect(game.measure(), equals((moves: 10, goalBucket: "two", otherBucket: 0)));
  }, skip: true);

  test("Goal larger than both buckets is impossible", () {
    final game = TwoBucket(bucketOne: 5, bucketTwo: 7, goal: 8, startBucket: "one");
    expect(() => game.measure(),
        throwsA(isA<ArgumentError>().having((e) => e.toString(), 'message', contains('impossible'))));
  }, skip: true);
}
