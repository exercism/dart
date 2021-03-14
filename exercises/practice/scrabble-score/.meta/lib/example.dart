final Map<String, int> _scores = const {
  'a': 1,
  'e': 1,
  'i': 1,
  'o': 1,
  'u': 1,
  'n': 1,
  'l': 1,
  'r': 1,
  's': 1,
  't': 1,
  'd': 2,
  'g': 2,
  'b': 3,
  'c': 3,
  'm': 3,
  'p': 3,
  'f': 4,
  'h': 4,
  'v': 4,
  'w': 4,
  'y': 4,
  'k': 5,
  'j': 8,
  'x': 8,
  'z': 10,
  'q': 10
};

int score(String word) {
  int val = 0;
  if (word.length > 0) {
    word.split('').forEach((char) {
      final score = _scores[char.toLowerCase()];
      val += score ?? 0;
    });
  }
  return val;
}
