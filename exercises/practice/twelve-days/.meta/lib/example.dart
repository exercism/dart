class TwelveDays {
  String recite(int startVerse, int endVerse) {
    List<String> result = [];
    for (int i = startVerse; i <= endVerse; i++) {
      List<String> gifts = availableGifts.sublist(0, i).reversed.toList();
      if (i > 1) {
        gifts[gifts.length - 1] = 'and ${gifts[gifts.length - 1]}';
      }
      result.add('On the ${days[i - 1]} day of Christmas my true love gave to me: ${gifts.join(', ')}.');
    }
    return result.join('\n');
  }

  static List<String> availableGifts = [
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ];

  static List<String> days = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
    'eleventh',
    'twelfth'
  ];
}
