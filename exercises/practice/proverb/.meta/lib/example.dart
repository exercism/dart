class Proverb {
  String recite(List<String> pieces) {
    if (pieces.isEmpty) {
      return '';
    }

    final List<String> results = [];
    for (int i = 0; i < pieces.length - 1; i++) {
      results.add('For want of a ${pieces[i]} the ${pieces[i + 1]} was lost.');
    }
    results.add('And all for the want of a ${pieces.first}.');

    return results.join('\n');
  }
}
