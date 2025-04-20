class BottleSong {
  List<String> recite(int startBottles, int takeDown) {
    List<String> lyrics = [];
    for (int i = 0; i < takeDown; i++) {
      int current = startBottles - i;

      String bottle = current == 1 ? 'bottle' : 'bottles';
      String nextBottle = current - 1 == 1 ? 'bottle' : 'bottles';
      String currentNumber = current.asQuantity();
      String nextNumber = (current - 1).asQuantity();

      lyrics.add(
          '${currentNumber.toTitleCase()} green ${bottle} hanging on the wall,');
      lyrics.add(
          '${currentNumber.toTitleCase()} green ${bottle} hanging on the wall,');
      lyrics.add('And if one green bottle should accidentally fall,');
      lyrics.add(
          "There'll be ${nextNumber} green ${nextBottle} hanging on the wall.");

      if (i < takeDown - 1) {
        lyrics.add('');
      }
    }

    return lyrics;
  }
}

extension StringExtension on String {
  String toTitleCase() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

extension IntExtension on int {
  String asQuantity() {
    switch (this) {
      case 1:
        return 'one';
      case 2:
        return 'two';
      case 3:
        return 'three';
      case 4:
        return 'four';
      case 5:
        return 'five';
      case 6:
        return 'six';
      case 7:
        return 'seven';
      case 8:
        return 'eight';
      case 9:
        return 'nine';
      case 10:
        return 'ten';
      default:
        return 'no';
    }
  }
}
