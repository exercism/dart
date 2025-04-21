import 'dart:math';

class ResistorColorTrio {
  final colors = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];

  String label(List<String> bands) {
    var [tens, ones, multiplier, ...] = bands;
    num value = colors.indexOf(tens) * 10 + colors.indexOf(ones);
    value *= pow(10, colors.indexOf(multiplier));

    if (value < 1e3) {
      return "${value} ohms";
    } else if (value < 1e6) {
      return "${value ~/ 1e3} kiloohms";
    } else if (value < 1e9) {
      return "${value ~/ 1e6} megaohms";
    } else {
      return "${value ~/ 1e9} gigaohms";
    }
  }
}
