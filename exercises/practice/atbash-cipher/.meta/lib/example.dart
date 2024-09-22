class AtbashCipher {
  final lowercaseA = 'a'.codeUnitAt(0);
  final lowercaseZ = 'z'.codeUnitAt(0);
  final uppercaseA = 'A'.codeUnitAt(0);
  final uppercaseZ = 'Z'.codeUnitAt(0);

  String encode(String input) {
    final encoded = StringBuffer();
    int count = 0;
    input.split('').where((elt) => elt.isAlphanumeric()).forEach((elt) {
      int char = elt.codeUnitAt(0);
      if (count == 5) {
        encoded.write(" ");
        count = 0;
      }

      if (char.isAlphabetic()) {
        char = char.isLowercase() ? char : char.toLowercase();
        char = lowercaseA + lowercaseZ - char;
      }

      encoded.write(String.fromCharCode(char));
      count += 1;
    });

    return encoded.toString();
  }

  String decode(String input) {
    final encoded = StringBuffer();
    input.split('').where((elt) => elt.isAlphanumeric()).forEach((elt) {
      int char = elt.codeUnitAt(0);
      if (char.isAlphabetic()) {
        char = char.isLowercase() ? char : char.toLowercase();
        char = lowercaseA + lowercaseZ - char;
      }

      encoded.write(String.fromCharCode(char));
    });
    return encoded.toString();
  }
}

extension IntNum on int {
  bool inRange(int lower, int upper) => this >= lower && this <= upper;
  bool isUppercase() => inRange('A'.codeUnitAt(0), 'Z'.codeUnitAt(0));
  bool isLowercase() => inRange('a'.codeUnitAt(0), 'z'.codeUnitAt(0));
  bool isAlphabetic() => isUppercase() || isLowercase();
  bool isNumeric() => this >= '0'.codeUnitAt(0) && this <= '9'.codeUnitAt(0);
  bool isAlphanumeric() => isAlphabetic() || isNumeric();
  bool isWhitespace() => this == ' '.codeUnitAt(0);
  int toLowercase() => this + 'a'.codeUnitAt(0) - 'A'.codeUnitAt(0);
}

extension StringExt on String {
  bool isWhitespace() => this.codeUnitAt(0).isWhitespace();
  bool isNotWhitespace() => !isWhitespace();
  bool isAlphanumeric() => this.codeUnitAt(0).isAlphanumeric();
}
