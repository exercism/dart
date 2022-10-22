class PigLatin {
  String translate(String phrase) {
    return phrase.split(' ').map(translateWord).join(' ');
  }

  String translateWord(String word) {
    if (wordStartsWithVowelLike(word)) return word + "ay";
    if (wordStartsWithPrefixes(word, ["thr", "sch"])) {
      return word.substring(3) + word.substring(0, 3) + "ay";
    }

    if (wordStartsWithPrefixes(word, ["ch", "qu", "th", "rh"])) {
      return word.substring(2) + word.substring(0, 2) + "ay";
    }

    if (wordStartsWithConsonantAndQu(word)) {
      return word.substring(3) + word[0] + "quay";
    }

    return word.substring(1) + word[0] + "ay";
  }

  bool wordStartsWithVowelLike(String word) {
    return RegExp(r'^([aeiou]|yt|xr)').hasMatch(word);
  }

  bool wordStartsWithPrefixes(String word, List<String> prefixes) {
    return prefixes.any((prefix) => word.startsWith(prefix));
  }

  bool wordStartsWithConsonantAndQu(String word) {
    return RegExp(r'[bcdfghjklmnpqrstvwxyz]qu').hasMatch(word);
  }
}
