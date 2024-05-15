class RotationalCipher {
  String rotate({required String text, required int shiftKey}) {
    return text.replaceAllMapped(RegExp(r'[[:alpha:]]'), (match) {
      var char = match[0]!.codeUnitAt(0);
      if (65 <= char && char <= 90) {
        char = (char - 65 + shiftKey) % 26 + 65;
      } else if (97 <= char && char <= 122) {
        char = (char - 97 + shiftKey) % 26 + 97;
      }
      return String.fromCharCode(char);
    });
  }
}
