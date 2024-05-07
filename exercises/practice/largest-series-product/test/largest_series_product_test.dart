import 'package:largest_series_product/largest_series_product.dart';
import 'package:test/test.dart';

void main() {
  final lsp = LargestSeriesProduct();

  test('finds the largest product if span equals length', () {
    final result = lsp.largestProduct("29", 2);
    expect(result, equals(18));
  }, skip: false);

  test('can find the largest product of 2 with numbers in order', () {
    final result = lsp.largestProduct("0123456789", 2);
    expect(result, equals(72));
  }, skip: true);

  test('can find the largest product of 2', () {
    final result = lsp.largestProduct("576802143", 2);
    expect(result, equals(48));
  }, skip: true);

  test('can find the largest product of 3 with numbers in order', () {
    final result = lsp.largestProduct("0123456789", 3);
    expect(result, equals(504));
  }, skip: true);

  test('can find the largest product of 3', () {
    final result = lsp.largestProduct("1027839564", 3);
    expect(result, equals(270));
  }, skip: true);

  test('can find the largest product of 5 with numbers in order', () {
    final result = lsp.largestProduct("0123456789", 5);
    expect(result, equals(15120));
  }, skip: true);

  test('can get the largest product of a big number', () {
    final result = lsp.largestProduct("73167176531330624919225119674426574742355349194934", 6);
    expect(result, equals(23520));
  }, skip: true);

  test('reports zero if the only digits are zero', () {
    final result = lsp.largestProduct("0000", 2);
    expect(result, equals(0));
  }, skip: true);

  test('reports zero if all spans include zero', () {
    final result = lsp.largestProduct("99099", 3);
    expect(result, equals(0));
  }, skip: true);

  test('rejects span longer than string length', () {
    expect(
        () => lsp.largestProduct("123", 4),
        throwsA(isA<ArgumentError>()
            .having((e) => e.message, 'message', contains('span must be smaller than string length'))));
  }, skip: true);

  test('reports 1 for empty string and empty product (0 span)', () {
    final result = lsp.largestProduct("", 0);
    expect(result, equals(1));
  }, skip: true);

  test('reports 1 for nonempty string and empty product (0 span)', () {
    final result = lsp.largestProduct("123", 0);
    expect(result, equals(1));
  }, skip: true);

  test('rejects empty string and nonzero span', () {
    expect(
        () => lsp.largestProduct("", 1),
        throwsA(isA<ArgumentError>()
            .having((e) => e.message, 'message', contains('span must be smaller than string length'))));
  }, skip: true);

  test('rejects invalid character in digits', () {
    expect(
        () => lsp.largestProduct("1234a5", 2),
        throwsA(isA<ArgumentError>()
            .having((e) => e.message, 'message', contains('digits input must only contain digits'))));
  }, skip: true);

  test('rejects negative span', () {
    expect(() => lsp.largestProduct("12345", -1),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('span must not be negative'))));
  }, skip: true);
}
