class PigLatin {
  String translate(String phrase) {
    return phrase.split(' ').map(_translateWord).join(' ');
  }

  String _translateWord(String word) {
    if (_wordStartsWithVowelLike(word)) return word + "ay";
    if (_wordStartsWithPrefixes(word, ["thr", "sch"])) {
      return word.substring(3) + word.substring(0, 3) + "ay";
    }

    if (_wordStartsWithPrefixes(word, ["ch", "qu", "th", "rh"])) {
      return word.substring(2) + word.substring(0, 2) + "ay";
    }

    if (_wordStartsWithConsonantAndQu(word)) {
      return word.substring(3) + word[0] + "quay";
    }

    return word.substring(1) + word[0] + "ay";
  }

  bool _wordStartsWithVowelLike(String word) {
    return RegExp(r'^([aeiou]|yt|xr)').hasMatch(word);
  }

  bool _wordStartsWithPrefixes(String word, List<String> prefixes) {
    return prefixes.any((prefix) => word.startsWith(prefix));
  }

  bool _wordStartsWithConsonantAndQu(String word) {
    return RegExp(r'[bcdfghjklmnpqrstvwxyz]qu').hasMatch(word);
  }
}
