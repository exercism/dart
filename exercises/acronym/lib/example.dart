class Acronym {
  String abbreviate(final String input) {
    StringBuffer acronymBuilder = new StringBuffer();

    RegExp separatorsExp = new RegExp(r'( )|(-)');
    List<String> list = input.split(separatorsExp);

    // Need to remove any empty strings in the list to avoid an error when `.toUpperCase()` is called.
    while (list.remove(''));

    for (String phrase in list) {
      // Need to remove any underscores used for emphasis in the string.
      phrase = phrase.replaceAll('_', '');

      final String acronym = phrase.trim().substring(0, 1).toUpperCase();
      acronymBuilder.write(acronym);
    }

    return acronymBuilder.toString();
  }
}
