class Allergies {
  final substances = ['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats'];

  bool allergicTo(String item, int score) {
    int index = substances.indexOf(item);
    return ((score >> index) & 1) == 1;
  }

  List<String> list(int score) => substances.where((t) => allergicTo(t, score)).toList();
}
