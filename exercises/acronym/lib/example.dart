class Acronym {
  String abbreviate(final String input) {
    StringBuffer acronymBuilder = new StringBuffer();

    RegExp separatorsExp = new RegExp(r'( )|(-)');
    List<String> list = input.split(separatorsExp);

    for (String phrase in list) {
      final String acronym = phrase.trim().substring(0, 1).toUpperCase();
      acronymBuilder.write(acronym);
    }

    return acronymBuilder.toString();
  }
}
