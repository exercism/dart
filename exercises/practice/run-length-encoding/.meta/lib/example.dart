class RunLengthEncoder {
  String encode(String plaintext) {
    return plaintext.replaceAllMapped(
        RegExp(r'(.)\1+'), (Match m) => m[0]!.length.toString() + m[1]!);
  }

  String decode(String ciphertext) {
    return ciphertext.replaceAllMapped(
        RegExp(r'(\d+)(.)'), (Match m) => m[2]! * int.parse(m[1]!));
  }
}
