class HighScores {
  final List<int> _scores;

  HighScores(this._scores);

  List<int> get getScores {
    return this._scores;
  }

  int get latest {
    return this._scores.last;
  }

  int get personalBest {
    var clone = []..addAll(this._scores);
    clone.sort();
    return clone.last;
  }

  List<int> get personalTopThree {
    var clone = []..addAll(this._scores);
    clone.sort();
    final sortedScores = clone.reversed.toList(growable: false);
    var result = <int>[];

    if (this._scores.length >= 3) {
      result = [
        sortedScores.first,
        sortedScores[1],
        sortedScores[2]
      ];
    } else if (this._scores.length == 2){
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
