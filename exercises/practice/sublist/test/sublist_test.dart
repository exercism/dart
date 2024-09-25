import 'package:sublist/sublist.dart';
import 'package:test/test.dart';

void main() {
  final sublist = Sublist();

  group('Sublist', () {
    test('empty lists', () {
      List<int> listOne = [];
      List<int> listTwo = [];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.equal;
      expect(result, equals(expected));
    }, skip: false);

    test('empty list within non empty list', () {
      List<int> listOne = [];
      List<int> listTwo = [1, 2, 3];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.sublist;
      expect(result, equals(expected));
    }, skip: true);

    test('non empty list contains empty list', () {
      List<int> listOne = [1, 2, 3];
      List<int> listTwo = [];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.superlist;
      expect(result, equals(expected));
    }, skip: true);

    test('list equals itself', () {
      List<int> listOne = [1, 2, 3];
      List<int> listTwo = [1, 2, 3];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.equal;
      expect(result, equals(expected));
    }, skip: true);

    test('different lists', () {
      List<int> listOne = [1, 2, 3];
      List<int> listTwo = [2, 3, 4];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.unequal;
      expect(result, equals(expected));
    }, skip: true);

    test('false start', () {
      List<int> listOne = [1, 2, 5];
      List<int> listTwo = [0, 1, 2, 3, 1, 2, 5, 6];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.sublist;
      expect(result, equals(expected));
    }, skip: true);

    test('consecutive', () {
      List<int> listOne = [1, 1, 2];
      List<int> listTwo = [0, 1, 1, 1, 2, 1, 2];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.sublist;
      expect(result, equals(expected));
    }, skip: true);

    test('sublist at start', () {
      List<int> listOne = [0, 1, 2];
      List<int> listTwo = [0, 1, 2, 3, 4, 5];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.sublist;
      expect(result, equals(expected));
    }, skip: true);

    test('sublist in middle', () {
      List<int> listOne = [2, 3, 4];
      List<int> listTwo = [0, 1, 2, 3, 4, 5];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.sublist;
      expect(result, equals(expected));
    }, skip: true);

    test('sublist at end', () {
      List<int> listOne = [3, 4, 5];
      List<int> listTwo = [0, 1, 2, 3, 4, 5];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.sublist;
      expect(result, equals(expected));
    }, skip: true);

    test('at start of superlist', () {
      List<int> listOne = [0, 1, 2, 3, 4, 5];
      List<int> listTwo = [0, 1, 2];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.superlist;
      expect(result, equals(expected));
    }, skip: true);

    test('in middle of superlist', () {
      List<int> listOne = [0, 1, 2, 3, 4, 5];
      List<int> listTwo = [2, 3];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.superlist;
      expect(result, equals(expected));
    }, skip: true);

    test('at end of superlist', () {
      List<int> listOne = [0, 1, 2, 3, 4, 5];
      List<int> listTwo = [3, 4, 5];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.superlist;
      expect(result, equals(expected));
    }, skip: true);

    test('first list missing element from second list', () {
      List<int> listOne = [1, 3];
      List<int> listTwo = [1, 2, 3];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.unequal;
      expect(result, equals(expected));
    }, skip: true);

    test('second list missing element from first list', () {
      List<int> listOne = [1, 2, 3];
      List<int> listTwo = [1, 3];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.unequal;
      expect(result, equals(expected));
    }, skip: true);

    test('first list missing additional digits from second list', () {
      List<int> listOne = [1, 2];
      List<int> listTwo = [1, 22];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.unequal;
      expect(result, equals(expected));
    }, skip: true);

    test('order matters to a list', () {
      List<int> listOne = [1, 2, 3];
      List<int> listTwo = [3, 2, 1];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.unequal;
      expect(result, equals(expected));
    }, skip: true);

    test('same digits but different numbers', () {
      List<int> listOne = [1, 0, 1];
      List<int> listTwo = [10, 1];
      final result = sublist.sublist(listOne, listTwo);
      final expected = Classification.unequal;
      expect(result, equals(expected));
    }, skip: true);
  });
}
