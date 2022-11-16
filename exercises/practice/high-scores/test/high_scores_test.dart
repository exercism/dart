import 'package:high_scores/high_scores.dart';
import 'package:test/test.dart';

void main() {
  group('HighScores: high scores tests - ', highScoresTests);
  group('HighScores: Top 3 scores - ', top3Scores);
}

void highScoresTests() {
  test('List of scores', () {
    const scores = HighScores(<int>[30, 50, 20, 70]);
    expect(scores.getScores, equals(<int>[30, 50, 20, 70]));
  }, skip: false);

  test('Latest score', () {
    const scores = HighScores(<int>[100, 0, 90, 30]);
    expect(scores.latest, equals(30));
  }, skip: true);

  test('Personal best', () {
    const scores = HighScores(<int>[40, 100, 70]);
    expect(scores.personalBest, equals(100));
  }, skip: true);
}

void top3Scores() {
  test('Personal top three from a list of scores', () {
    const scores = HighScores(<int>[10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]);
    expect(scores.personalTopThree, equals(<int>[100, 90, 70]));
  }, skip: true);

  test('Personal top highest to lowest', () {
    const scores = HighScores(<int>[20, 10, 30]);
    expect(scores.personalTopThree, equals(<int>[30, 20, 10]));
  }, skip: true);

  test('Personal top when there is a tie', () {
    const scores = HighScores(<int>[40, 20, 40, 30]);
    expect(scores.personalTopThree, equals(<int>[40, 40, 30]));
  }, skip: true);

  test('Personal top when there are less than 3', () {
    const scores = HighScores(<int>[30, 70]);
    expect(scores.personalTopThree, equals(<int>[70, 30]));
  }, skip: true);

  test('Personal top when there is only one', () {
    const scores = HighScores(<int>[40]);
    expect(scores.personalTopThree, equals(<int>[40]));
  }, skip: true);

  test('Latest score after personal top scores', () {
    const scores = HighScores(<int>[70, 50, 20, 30]);
    scores.personalTopThree;
    expect(scores.latest, equals(30));
  }, skip: true);

  test('Scores after personal top scores', () {
    const scores = HighScores(<int>[30, 50, 20, 70]);
    scores.personalTopThree;
    expect(scores.getScores, equals(<int>[30, 50, 20, 70]));
  }, skip: true);

  test('Latest score after personal best', () {
    const scores = HighScores(<int>[20, 70, 15, 25, 30]);
    scores.personalBest;
    expect(scores.latest, equals(30));
  }, skip: true);

  test('Scores after personal best', () {
    const scores = HighScores(<int>[20, 70, 15, 25, 30]);
    scores.personalBest;
    expect(scores.getScores, equals(<int>[20, 70, 15, 25, 30]));
  }, skip: true);
}
