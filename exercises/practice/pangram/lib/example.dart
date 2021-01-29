class Pangram {
  bool isPangram(String sentence) {
    Set<String> uniqueLetters = new Set();
    String cleanSentence = sentence.toLowerCase().replaceAll(new RegExp(r"[^a-zA-Z]"), "");
    uniqueLetters.addAll(cleanSentence.split(""));

    return uniqueLetters.length == 26;
  }
}
