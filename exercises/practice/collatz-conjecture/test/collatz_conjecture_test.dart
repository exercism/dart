import 'package:collatz_conjecture/collatz_conjecture.dart';
import 'package:test/test.dart';

void main() {
  final collatzConjecture = CollatzConjecture();

  /// We are using a predicate to better match the error message from collatzConjecture.
  /// Knowing about predicates are not needed for completing this exercise,
  /// but you can find out more info at https://pub.dev/documentation/test/latest/
  /// if you wish to learn more about predicates and matchers used in Unit Testing for Dart.
  final onlyPositive = predicate(
      (ArgumentError e) => e is ArgumentError && e.message == 'Only positive integers are allowed',
      'an ArgumentError with the message "Only positive integers are allowed"');

  group('CollatzConjecture', () {
    test('zero steps for one', () {
      final result = collatzConjecture.steps(1);
      expect(result, equals(0));
    }, skip: false);

    test('divide if even', () {
      final result = collatzConjecture.steps(16);
      expect(result, equals(4));
    }, skip: true);

    test('even and odd steps', () {
      final result = collatzConjecture.steps(12);
      expect(result, equals(9));
    }, skip: true);

    test('large number of even and odd steps', () {
      final result = collatzConjecture.steps(1000000);
      expect(result, equals(152));
    }, skip: true);

    test('zero is an error', () {
      expect(() => collatzConjecture.steps(0), throwsA(onlyPositive));
    }, skip: true);

    test('negative value is an error', () {
      expect(() => collatzConjecture.steps(-15), throwsA(onlyPositive));
    }, skip: true);
  });
}
