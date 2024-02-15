import 'package:list_ops/list_ops.dart';
import 'package:test/test.dart';

void main() {
  group('append entries to a list and return the new list', () {
    test('empty lists', () {
      final list1 = [];
      final list2 = [];
      list1.append(list2);
      expect(list1, equals([]));
    }, skip: false);

    test('list to empty list', () {
      final list1 = [];
      final list2 = [1, 2, 3, 4];
      list1.append(list2);
      expect(list1, equals([1, 2, 3, 4]));
    }, skip: true);

    test('empty list to list', () {
      final list1 = [1, 2, 3, 4];
      final list2 = [];
      list1.append(list2);
      expect(list1, equals([1, 2, 3, 4]));
    }, skip: true);

    test('non-empty lists', () {
      final list1 = [1, 2];
      final list2 = [2, 3, 4, 5];
      list1.append(list2);
      expect(list1, equals([1, 2, 2, 3, 4, 5]));
    }, skip: true);
  });

  group('concatenate a list of lists', () {
    test('empty list', () {
      final lists = [];
      final result = lists.concat();
      expect(result, equals([]));
    }, skip: true);

    test('list of lists', () {
      final lists = [
        [1, 2],
        [3],
        [],
        [4, 5, 6]
      ];
      final result = lists.concat();
      expect(result, equals([1, 2, 3, 4, 5, 6]));
      // does not mutate the original list
      expect(
          lists,
          equals([
            [1, 2],
            [3],
            [],
            [4, 5, 6]
          ]));
    }, skip: true);

    test('list of nested lists', () {
      final lists = [
        [
          [1],
          [2]
        ],
        [
          [3]
        ],
        [[]],
        [
          [4, 5, 6]
        ]
      ];
      final result = lists.concat();
      expect(
          result,
          equals([
            [1],
            [2],
            [3],
            [],
            [4, 5, 6]
          ]));
    }, skip: true);
  });

  group('filter list returning only values that satisfy the filter function', () {
    test('empty list', () {
      final list = [];
      final result = list.filter((int x) => x % 2 == 1);
      expect(result, equals([]));
    }, skip: true);

    test('non-empty list', () {
      final list = [1, 2, 3, 5];
      final result = list.filter((int x) => x % 2 == 1);
      expect(result, equals([1, 3, 5]));
      expect(list, equals([1, 2, 3, 5]));
    }, skip: true);
  });

  group('returns the length of a list', () {
    test('empty list', () {
      final list = [];
      final result = list.count();
      expect(result, equals(0));
    }, skip: true);

    test('non-empty list', () {
      final list = [1, 2, 3, 4];
      final result = list.count();
      expect(result, equals(4));
    }, skip: true);
  });

  group('return a list of elements whose values equal the list value transformed by the mapping function', () {
    test('empty list', () {
      final list = [];
      final result = list.myMap((int x) => x + 1);
      expect(result, equals([]));
    }, skip: true);

    test('non-empty list', () {
      final list = [1, 3, 5, 7];
      final result = list.myMap((int x) => x + 1);
      expect(result, equals([2, 4, 6, 8]));
      expect(list, equals([1, 3, 5, 7]));
    }, skip: true);
  });

  group('folds (reduces) the given list from the left with a function', () {
    test('empty list', () {
      final list = [];
      final result = list.foldl(2, (int acc, int el) => el * acc);
      expect(result, equals(2));
    }, skip: true);

    test('direction independent function applied to non-empty list', () {
      final list = [1, 2, 3, 4];
      final result = list.foldl(5, (int acc, int el) => el + acc);
      expect(result, equals(15));
    }, skip: true);

    test('direction dependent function applied to non-empty list', () {
      final list = [1, 2, 3, 4];
      final result = list.foldl(24, (num acc, int el) => el / acc);
      expect(result, equals(64));
    }, skip: true);
  });

  group('folds (reduces) the given list from the right with a function', () {
    test('empty list', () {
      final list = [];
      final result = list.foldr(2, (int el, int acc) => el * acc);
      expect(result, equals(2));
    }, skip: true);

    test('direction independent function applied to non-empty list', () {
      final list = [1, 2, 3, 4];
      final result = list.foldr(5, (int el, int acc) => el + acc);
      expect(result, equals(15));
    }, skip: true);

    test('direction dependent function applied to non-empty list', () {
      final list = [1, 2, 3, 4];
      final result = list.foldr(24, (int el, num acc) => el / acc);
      expect(result, equals(9));
    }, skip: true);
  });

  group('reverse the elements of the list', () {
    test('empty list', () {
      final list = [];
      final result = list.reverse();
      expect(result, equals([]));
    }, skip: true);

    test('non-empty list', () {
      final list = [1, 3, 5, 7];
      final result = list.reverse();
      expect(result, equals([7, 5, 3, 1]));
      expect(list, equals([1, 3, 5, 7]));
    }, skip: true);

    test('list of lists is not flattened', () {
      final list = [
        [1, 2],
        [3],
        [],
        [4, 5, 6]
      ];
      final result = list.reverse();
      expect(
          result,
          equals([
            [4, 5, 6],
            [],
            [3],
            [1, 2]
          ]));
    }, skip: true);
  });
}
