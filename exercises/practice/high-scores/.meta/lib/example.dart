class HighScores {
  List<int> scores = [];

  HighScores(List<int> inputScores) {
    this.scores = inputScores;
  }

  List<int> get getScores {
    return scores;
  }

  int latest() {
    return scores.last;
  }

  int personalBest() {
    var clone = []..addAll(scores);
    clone.sort();
    return clone.last;
  }

  List<int> personalTopThree() {
    var clone = []..addAll(scores);
    clone.sort();
    final sortedScores = clone.reversed.toList(growable: false);
    var result = <int>[];

    if (scores.length >= 3) {
      result = [
        sortedScores.first,
        sortedScores[1],
        sortedScores[2]
      ];
    } else if (scores.length == 2){
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
}
