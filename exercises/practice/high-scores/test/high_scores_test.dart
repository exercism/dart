import 'package:high_scores/high_scores.dart';
import 'package:test/test.dart';

final highScores = HighScores();

void main() {
  group('HighScores: high scores tests - ', highScoresTests);
  group('HighScores: Top 3 scores - ', top3Scores);
}

void highScoresTests() {
  test('List of scores', () {
    final result = highScores.scores(<int>[30, 50, 20, 70]);
    expect(result, equals(<int>[30, 50, 20, 70]));
  }, skip: false);

  test('Latest score', () {
    final result = highScores.latest(<int>[100, 0, 90, 30]);
    expect(result, equals(30));
  }, skip: true);

  test('Personal best', () {
    final result = highScores.personalBest(<int>[40, 100, 70]);
    expect(result, equals(100));
  }, skip: true);
}

void top3Scores() {
  test('Personal top three from a list of scores', () {
    final result = highScores.personalTopThree(<int>[10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]);
    expect(result, equals(<int>[100, 90, 70]));
  }, skip: true);

  test('Personal top highest to lowest', () {
    final result = highScores.personalTopThree(<int>[20, 10, 30]);
    expect(result, equals(<int>[30, 20, 10]));
  }, skip: true);

  test('Personal top when there is a tie', () {
    final result = highScores.personalTopThree(<int>[40, 20, 40, 30]);
    expect(result, equals(<int>[40, 40, 30]));
  }, skip: true);

  test('Personal top when there are less than 3', () {
    final result = highScores.personalTopThree(<int>[30, 70]);
    expect(result, equals(<int>[70, 30]));
  }, skip: true);

  test('Personal top when there is only one', () {
    final result = highScores.personalTopThree(<int>[40]);
    expect(result, equals(<int>[40]));
  }, skip: true);
}
