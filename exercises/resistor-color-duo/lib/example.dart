class ResistorColorDuo {
  final colors = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];

  int value(List<String> input) {
    if (input.length > 2) input.removeLast();
    return int.parse(input.map(colors.indexOf).join());
  }
}
