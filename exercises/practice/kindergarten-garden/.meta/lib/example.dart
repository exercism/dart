enum Plant {
  radishes,
  clover,
  violets,
  grass,
}

enum Student {
  Alice,
  Bob,
  Charlie,
  David,
  Eve,
  Fred,
  Ginny,
  Harriet,
  Ileana,
  Joseph,
  Kincaid,
  Larry,
}

class KindergartenGarden {
  final String diagram;
  KindergartenGarden(this.diagram);

  List<Plant> plants(Student student) {
    var garden = parseGarden();
    return garden[student.index];
  }

  List<List<Plant>> parseGarden() {
    var pieces = diagram.split("\n").map((row) {
      return RegExp("..").allMatches(row).map((m) => m[0]).toList();
    }).toList();
    var range = List.generate(pieces[0].length, (i) => i);
    var plots = range.map((i) => pieces[0][i]! + pieces[1][i]!);
    List<List<Plant>> garden = plots.map((plot) {
      return plot.split("").map((c) => plant(c)).toList();
    }).toList();
    return garden;
  }

  Plant plant(String char) => switch (char) {
        "R" => Plant.radishes,
        "C" => Plant.clover,
        "V" => Plant.violets,
        _ => Plant.grass,
      };
}
