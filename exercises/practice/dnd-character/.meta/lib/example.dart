import 'dart:math';

class DndCharacter {
  static int modifier(int value) {
    return ((value - 10) / 2).floor();
  }

  static int ability() {
    final d6 = () => 1 + Random().nextInt(6);
    final rolls = [d6(), d6(), d6(), d6()];
    final total = rolls.fold(0, (s, roll) => s + roll);
    final least = rolls.fold(7, (m, roll) => min(m, roll));
    return total - least;
  }

  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final int hitpoints;

  DndCharacter(this.strength, this.dexterity, this.constitution,
      this.intelligence, this.wisdom, this.charisma, this.hitpoints);

  factory DndCharacter.create() {
    final constitution = ability();
    return DndCharacter(ability(), ability(), constitution, ability(),
        ability(), ability(), 10 + modifier(constitution));
  }
}
