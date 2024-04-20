import 'package:dnd_character/dnd_character.dart';
import 'package:test/test.dart';

void main() {
  group('DndCharacter: ability modifier - ', abilityModifier);
  group('DndCharacter: abilities - ', abilities);
}

void abilityModifier() {
  test('ability modifier for score 3 is -4', () {
    expect(DndCharacter.modifier(3), equals(-4));
  }, skip: false);

  test('ability modifier for score 4 is -3', () {
    expect(DndCharacter.modifier(4), equals(-3));
  }, skip: true);

  test('ability modifier for score 5 is -3', () {
    expect(DndCharacter.modifier(5), equals(-3));
  }, skip: true);

  test('ability modifier for score 6 is -2', () {
    expect(DndCharacter.modifier(6), equals(-2));
  }, skip: true);

  test('ability modifier for score 7 is -2', () {
    expect(DndCharacter.modifier(7), equals(-2));
  }, skip: true);

  test('ability modifier for score 8 is -1', () {
    expect(DndCharacter.modifier(8), equals(-1));
  }, skip: true);

  test('ability modifier for score 9 is -1', () {
    expect(DndCharacter.modifier(9), equals(-1));
  }, skip: true);

  test('ability modifier for score 10 is 0', () {
    expect(DndCharacter.modifier(10), equals(0));
  }, skip: true);

  test('ability modifier for score 11 is 0', () {
    expect(DndCharacter.modifier(11), equals(0));
  }, skip: true);

  test('ability modifier for score 12 is +1', () {
    expect(DndCharacter.modifier(12), equals(1));
  }, skip: true);

  test('ability modifier for score 13 is +1', () {
    expect(DndCharacter.modifier(13), equals(1));
  }, skip: true);

  test('ability modifier for score 14 is +2', () {
    expect(DndCharacter.modifier(14), equals(2));
  }, skip: true);

  test('ability modifier for score 15 is +2', () {
    expect(DndCharacter.modifier(15), equals(2));
  }, skip: true);

  test('ability modifier for score 16 is +3', () {
    expect(DndCharacter.modifier(16), equals(3));
  }, skip: true);

  test('ability modifier for score 17 is +3', () {
    expect(DndCharacter.modifier(17), equals(3));
  }, skip: true);

  test('ability modifier for score 18 is +4', () {
    final result = DndCharacter.modifier(18);
    expect(result, equals(4));
  }, skip: true);
}

void abilities() {
  test('random ability is within range', () {
    final score = DndCharacter.ability();
    expect(score, inInclusiveRange(3, 18));
  }, skip: true);

  test('random character is valid', () {
    final character = DndCharacter.create();
    expect(character.strength, inInclusiveRange(3, 18));
    expect(character.dexterity, inInclusiveRange(3, 18));
    expect(character.constitution, inInclusiveRange(3, 18));
    expect(character.intelligence, inInclusiveRange(3, 18));
    expect(character.wisdom, inInclusiveRange(3, 18));
    expect(character.charisma, inInclusiveRange(3, 18));
    expect(character.hitpoints, equals(10 + DndCharacter.modifier(character.constitution)));
  }, skip: true);

  test('each ability is only calculated once', () {
    final character = DndCharacter.create();

    var read1 = character.strength;
    var read2 = character.strength;
    expect(read1, equals(read2));

    read1 = character.dexterity;
    read2 = character.dexterity;
    expect(read1, equals(read2));

    read1 = character.constitution;
    read2 = character.constitution;
    expect(read1, equals(read2));

    read1 = character.intelligence;
    read2 = character.intelligence;
    expect(read1, equals(read2));

    read1 = character.wisdom;
    read2 = character.wisdom;
    expect(read1, equals(read2));

    read1 = character.charisma;
    read2 = character.charisma;
    expect(read1, equals(read2));
  }, skip: true);
}
