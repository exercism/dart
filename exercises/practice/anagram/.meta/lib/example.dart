class Anagram {
  List<String> findAnagrams(String subject, List<String> candidates) {
    Map<String, int> subjectCharsMap = countCharacters(subject);

    List<String> matchTracker = <String>[];

    for (String possible in candidates) {
      if (possible.toLowerCase() != subject.toLowerCase()) {
        Map<String, int> possibleCharMap = countCharacters(possible);

        if (mapsMatch(subjectCharsMap, possibleCharMap)) {
          matchTracker.add(possible);
        }
        possibleCharMap.clear();
      }
    }

    return matchTracker;
  }

  Map<String, int> countCharacters(String word) {
    Map<String, int> charTracker = <String, int>{};

    for (int counter = 0; counter < word.length; counter++) {
      var key = word[counter].toLowerCase();

      charTracker[key] = charTracker.containsKey(key) ? charTracker[key]! + 1 : 1;
    }

    return charTracker;
  }
}

bool mapsMatch(Map<String, int> subjectCharsMap, Map<String, int> possibleCharMap) {
  List<bool> trackingMatches = <bool>[];

  for (String key in possibleCharMap.keys) {
    if (subjectCharsMap.containsKey(key)) {
      trackingMatches.add(subjectCharsMap[key] == possibleCharMap[key]);
    } else {
      return false;
    }
  }

  for (bool result in trackingMatches) {
    if (result == false) {
      return false;
    }
  }

  return trackingMatches.length == subjectCharsMap.length;
}
