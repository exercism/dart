class HighScores {
  List<int> _scores = [];

  HighScores(List<int> inputScores) {
    this._scores = inputScores;
  }

  List<int> get getScores {
    return _scores;
  }

  int latest() {
    return _scores.last;
  }

  int personalBest() {
    var clone = []..addAll(_scores);
    clone.sort();
    return clone.last;
  }

  List<int> personalTopThree() {
    var clone = []..addAll(_scores);
    clone.sort();
    final sortedScores = clone.reversed.toList(growable: false);
    var result = <int>[];

    if (_scores.length >= 3) {
      result = [
        sortedScores.first,
        sortedScores[1],
        sortedScores[2]
      ];
    } else if (_scores.length == 2){
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
