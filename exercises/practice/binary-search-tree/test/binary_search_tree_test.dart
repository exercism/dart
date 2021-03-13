import 'package:binary_search_tree/binary_search_tree.dart';
import 'package:test/test.dart';

void main() {
  group('BinarySearchTree', () {
    test('data is retained', () {
      final bst = BinarySearchTree('4');

      expect(bst.root.data, equals('4'));
    }, skip: false);

    group('insert data at proper node', () {
      test('smaller number at left node', () {
        final bst = BinarySearchTree('4')..insert('2');

        expect(bst.root.data, equals('4'));
        expect(bst.root.left!.data, equals('2'));
      }, skip: true);

      test('same number at left node', () {
        final bst = BinarySearchTree('4')..insert('4');

        expect(bst.root.data, equals('4'));
        expect(bst.root.left!.data, equals('4'));
      }, skip: true);

      test('greater number at right node', () {
        final bst = BinarySearchTree('4')..insert('5');

        expect(bst.root.data, equals('4'));
        expect(bst.root.right!.data, equals('5'));
      }, skip: true);

      test('can create complex tree', () {
        final bst = BinarySearchTree('4')..insert('2')..insert("6")..insert("1")..insert("3")..insert("5")..insert("7");

        expect(bst.root.data, equals('4'));

        expect(bst.root.left!.data, equals('2'));
        expect(bst.root.left!.left!.data, equals('1'));
        expect(bst.root.left!.right!.data, equals('3'));

        expect(bst.root.right!.data, equals('6'));
        expect(bst.root.right!.left!.data, equals('5'));
        expect(bst.root.right!.right!.data, equals('7'));
      }, skip: true);
    });

    group('can sort data', () {
      test('can sort single number', () {
        final bst = BinarySearchTree('2');

        expect(bst.sortedData, equals(['2']));
      }, skip: true);

      test('can sort if second number is smaller than first', () {
        final bst = BinarySearchTree('2')..insert('1');

        expect(bst.sortedData, equals(['1', '2']));
      }, skip: true);

      test('can sort if second number is same as first', () {
        final bst = BinarySearchTree('2')..insert('2');

        expect(bst.sortedData, equals(['2', '2']));
      }, skip: true);

      test('can sort if second number is greater than first', () {
        final bst = BinarySearchTree('2')..insert('3');

        expect(bst.sortedData, equals(['2', '3']));
      }, skip: true);

      test('can sort complex tree', () {
        final bst = BinarySearchTree('2')..insert("1")..insert("3")..insert("6")..insert("7")..insert("5");

        expect(bst.sortedData, equals(['1', '2', '3', '5', '6', '7']));
      }, skip: true);
    });
  });
}
