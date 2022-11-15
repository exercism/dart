class HighScores {

  List<int> scores(List<int> inputScores) {
    return inputScores;
  }

  int latest(List<int> inputScores) {
    return inputScores.last;
  }

  int personalBest(List<int> inputScores) {
    inputScores.sort();
    return inputScores.reversed.first;
  }

  List<int> personalTopThree(List<int> inputScores) {
    inputScores.sort();
    final sortedScores = inputScores.reversed.toList(growable: false);
    var result = <int>[];

    if (inputScores.length >= 3) {
      result = [
        sortedScores.first,
        sortedScores[1],
        sortedScores[2]
      ];
    } else if (inputScores.length == 2){
      result = [
        sortedScores.first,
        sortedScores[1]
      ];
    } else {
      result = [
        sortedScores.first
      ];
    }
    return result;
  }

  int latestAfterTopThree(List<int> inputScores) {
    return inputScores.last;
  }

  List<int> scoresAfterTopThree(List<int> inputScores) {
    return inputScores;
  }

  int latestAfterBest(List<int> inputScores) {
    return inputScores.last;
  }

  List<int> scoresAfterBest(List<int> inputScores) {
    return inputScores;
  }
}