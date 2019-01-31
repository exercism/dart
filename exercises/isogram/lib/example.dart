class Isogram {
  bool isIsogram(String phrase) {
    // since only alpha characters count, lose everything but
    // the alphabet.
    List<String> chars = phrase.toLowerCase().replaceAll(new RegExp(r'[^a-z]'), '').split('');

    // used a C-style for loop here since I needed the indicies anyway.
    for (int firstIndex = 0; firstIndex < chars.length; firstIndex++) {
      String char = chars[firstIndex];
      // each character should only be present once in an isogram.
      // if it does occur more than once, the first and last indexes won't match.
      if (firstIndex != chars.lastIndexOf(char)) {
        return false;
      }
    }

    return true;
  }
}
