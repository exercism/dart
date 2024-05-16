class RotationalCipher {
  String rotate({required String text, required int shiftKey}) {
    return text.replaceAllMapped(RegExp(r'\p{L}', unicode: true), (match) {
      var letter = match[0]!.codeUnitAt(0);
      if (65 <= letter && letter <= 90) {
        letter = (letter - 65 + shiftKey) % 26 + 65;
      } else if (97 <= letter && letter <= 122) {
        letter = (letter - 97 + shiftKey) % 26 + 97;
      }
      return String.fromCharCode(letter);
    });
  }
}
