class Luhn {
  bool valid(String value) {
    String clean = value.replaceAll(new RegExp(r'\s'), '');

    if (clean.length <= 1 || clean.contains(new RegExp(r'\D'))) {
      return false;
    }

    int doubleEverySecond = 0;

    clean.split('').reversed.map(int.parse).toList().asMap().forEach((index, number) {
      int b = index.isOdd ? number * 2 : number;
      doubleEverySecond += b > 9 ? b - 9 : b;
    });

    return doubleEverySecond % 10 == 0;
  }
}
