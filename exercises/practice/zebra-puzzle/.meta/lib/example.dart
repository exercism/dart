const FIRST = 1;
const MIDDLE = 3;

class ZebraPuzzle {
  String? drinksWater;
  String? ownsZebra;

  void solve() {
    for (final p1 in permutations([1, 2, 3, 4, 5], 5)) {
      // colours ------------------------------------------------------
      var [red, green, ivory, yellow, blue] = p1;
      if (toTheRightOf(green, ivory)) {
        for (final p2 in permutations([1, 2, 3, 4, 5], 5)) {
          // nationalities --------------------------------------------
          var [english, spanish, ukrainian, norwegian, japanese] = p2;
          var nationalities = {
            english: 'Englishman',
            spanish: 'Spaniard',
            ukrainian: 'Ukrainian',
            norwegian: 'Norwegian',
            japanese: 'Japanese',
          };
          if (english == red && norwegian == FIRST && nextTo(norwegian, blue)) {
            for (final p3 in permutations([1, 2, 3, 4, 5], 5)) {
              // beverages --------------------------------------------
              var [coffee, tea, milk, orangeJuice, water] = p3;
              if (coffee == green && ukrainian == tea && milk == MIDDLE) {
                for (final p4 in permutations([1, 2, 3, 4, 5], 5)) {
                  // smokes -------------------------------------------
                  var [oldGold, kools, chesterfields, luckyStrike, parliaments] = p4;
                  if (kools == yellow && luckyStrike == orangeJuice && japanese == parliaments) {
                    for (final p5 in permutations([1, 2, 3, 4, 5], 5)) {
                      // pets -----------------------------------------
                      var [dog, snails, fox, horse, zebra] = p5;
                      if (spanish == dog && oldGold == snails && nextTo(chesterfields, fox) && nextTo(kools, horse)) {
                        // all conditions met!
                        drinksWater = nationalities[water];
                        ownsZebra = nationalities[zebra];
                        return;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  bool toTheRightOf(a, b) => a == b + 1;
  bool nextTo(a, b) => toTheRightOf(a, b) || toTheRightOf(b, a);

  // https://github.com/csuka1219/dart-list-permutations/blob/main/permutations.dart
  // This function generates all permutations of a given length from a list of items.
  // It uses a recursive approach to generate the permutations.
  // The function is a generator, so it yields each permutation as it is generated.
  Iterable<List<T>> permutations<T>(List<T> items, int length) sync* {
    // If the desired length is 0, yield an empty list and return.
    if (length == 0) {
      yield <T>[];
      return;
    }

    // Loop over the items in the input list.
    for (int i = 0; i < items.length; i++) {
      // Select the current item.
      T current = items[i];

      // Create a new list of remaining items by removing the current item from the input list.
      List<T> remaining = List<T>.from(items)..removeAt(i);

      // Generate all permutations of length length-1 from the remaining items.
      for (List<T> permutation in permutations(remaining, length - 1)) {
        // Yield a new list consisting of the current item followed by the permutation.
        yield [current, ...permutation];
      }
    }
  }
}
