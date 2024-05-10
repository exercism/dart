const List<Map<String, String>> _chain = [
  {'species': 'fly'},
  {
    'species': 'spider',
    'action': 'It wriggled and jiggled and tickled inside her.',
    'extra': ' that wriggled and jiggled and tickled inside her'
  },
  {'species': 'bird', 'action': 'How absurd to swallow a bird!'},
  {'species': 'cat', 'action': 'Imagine that, to swallow a cat!'},
  {'species': 'dog', 'action': 'What a hog, to swallow a dog!'},
  {
    'species': 'goat',
    'action': 'Just opened her throat and swallowed a goat!'
  },
  {'species': 'cow', 'action': "I don't know how she swallowed a cow!"},
  {'species': 'horse', 'action': "She's dead, of course!"}
];

class FoodChain {
  List<String> recite(int start, int end) {
    var stanzas = <String>[];
    for (int i = start - 1; i < end; i++) {
      if (i >= start) {
        stanzas.add("");
      }

      var animal = _chain[i];
      stanzas.add(
          "I know an old lady who swallowed a " + animal['species']! + ".");
      var action = animal['action'];
      if (action != null) {
        stanzas.add(action);
      }

      if (animal['species']! == 'horse') break;
      for (int j = i; j >= 1; j--) {
        var predator = _chain[j];
        var prey = _chain[j - 1];
        stanzas.add("She swallowed the " +
            predator['species']! +
            " to catch the " +
            prey['species']! +
            (prey['extra'] ?? "") +
            ".");
      }
      stanzas
          .add("I don't know why she swallowed the fly. Perhaps she'll die.");
    }
    return stanzas;
  }
}
