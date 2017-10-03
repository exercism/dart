class WordCount {
  Map<String, int> countWords(String input) {
    Map<String, int> count = new Map();
    // make a list of all words using regex.
    // \\w+ matches any number of letters
    //  e.g. one two three
    // \\w+'\\w  => matches any number of letters then "'" and then a single letter
    //  e.g. don't
    // \\d+ matches one or more digits
    List<String> allwords = new List();
    var wordMatches =
        new RegExp("\\w+'\\w|\\w+|d+").allMatches(input.toLowerCase());
    for (var match in wordMatches) {
      allwords.add(match.group(0));
    }
    // print(allwords);
    // Lists aka "arrays" have a forEach method that applies a function to
    // each element of the list.
    // initialize the Map with all words and there counter to 0
    allwords.forEach((singleWord) => count[singleWord] = 0);
    // count all words and set there counter accordingly
    allwords.forEach((singleWord) => count[singleWord] = count[singleWord] + 1);
    return count;
  }
}
