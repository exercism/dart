class ResistorColorDuo {
  final colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];

  int value(List<String> input) => int.parse(input.map(colors.indexOf).join());
}
