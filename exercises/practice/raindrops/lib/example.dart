class Raindrops {
  String convert(int i) {
    bool isDiv(int divisor) {
      return i % divisor == 0;
    }

    String out = "";
    if (isDiv(3)) {
      out += "Pling";
    }
    if (isDiv(5)) {
      out += "Plang";
    }
    if (isDiv(7)) {
      out += "Plong";
    }

    if (out == "") {
      out = i.toString();
    }
    return out;
  }
}
