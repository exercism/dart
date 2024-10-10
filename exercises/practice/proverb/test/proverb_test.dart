import 'package:proverb/proverb.dart';
import 'package:test/test.dart';

void main() {
  final proverb = Proverb();

  group('Proverb', () {
    test('zero pieces', () {
      List<String> pieces = [];
      final result = proverb.recite(pieces);
      final expected = "";
      expect(result, equals(expected));
    }, skip: false);

    test('one piece', () {
      final pieces = ["nail"];
      final result = proverb.recite(pieces);
      final expected = "And all for the want of a nail.";
      expect(result, equals(expected));
    }, skip: true);

    test('two pieces', () {
      final pieces = ["nail", "shoe"];
      final result = proverb.recite(pieces);
      final expected = '''
For want of a nail the shoe was lost.
And all for the want of a nail.''';
      expect(result, equals(expected));
    }, skip: true);

    test('three pieces', () {
      final pieces = ["nail", "shoe", "horse"];
      final result = proverb.recite(pieces);
      final expected = '''
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.''';
      expect(result, equals(expected));
    }, skip: true);

    test('full proverb', () {
      final pieces = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"];
      final result = proverb.recite(pieces);
      final expected = '''
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.''';
      expect(result, equals(expected));
    }, skip: true);

    test('four pieces modernized', () {
      final pieces = ["pin", "gun", "soldier", "battle"];
      final result = proverb.recite(pieces);
      final expected = '''
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.''';
      expect(result, equals(expected));
    }, skip: true);
  });
}
