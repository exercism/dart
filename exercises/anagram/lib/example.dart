class Anagram {
  List<String> findAngrams(String subject, List<String> candidates) {
    Map<String, int> subjectCharsMap = countChracters(subject);

    List<String> matchTracker = new List<String>();

    for (String possible in candidates) {
      if (possible.toLowerCase() != subject.toLowerCase()) {
        Map<String, int> possibleCharMap = countChracters(possible);

        if (mapsMatch(subjectCharsMap, possibleCharMap)) {
          matchTracker.add(possible);
        }
        possibleCharMap.clear();
      }
    }

    return matchTracker;
  }

  Map<String, int> countChracters(String word) {
    Map<String, int> charTracker = new Map<String, int>();

    for (int counter = 0; counter < word.length; counter++) {
      var key = word[counter].toLowerCase();

      charTracker[key] = charTracker.containsKey(key) ? charTracker[key] + 1 : 1;
    }

    return charTracker;
  }
}

bool mapsMatch(Map<String, int> subjectCharsMap, Map<String, int> possibleCharMap) {
  List<bool> trackingMatches = new List<bool>();

  for(String key in possibleCharMap.keys) {
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