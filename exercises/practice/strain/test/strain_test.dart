import 'package:strain/strain.dart';
import 'package:test/test.dart';

void main() {
  final strain = Strain();

  group('Strain', () {
    group('Keep', () {
      test('keep on empty list returns empty list', () {
        final values = [];
        final fn = (x) => true;
        final result = strain.keep(values, fn);
        final expected = [];
        expect(result, equals(expected));
      }, skip: false);

      test('keeps everything', () {
        final values = [1, 3, 5];
        final fn = (x) => true;
        final result = strain.keep(values, fn);
        final expected = [1, 3, 5];
        expect(result, equals(expected));
      }, skip: false);

      test('keeps nothing', () {
        final values = [1, 3, 5];
        final fn = (x) => false;
        final result = strain.keep(values, fn);
        final expected = [];
        expect(result, equals(expected));
      }, skip: false);

      test('keeps first and last', () {
        final values = [1, 2, 3];
        final fn = (x) => x % 2 == 1;
        final result = strain.keep(values, fn);
        final expected = [1, 3];
        expect(result, equals(expected));
      }, skip: false);

      test('keeps neither first nor last', () {
        final values = [1, 2, 3];
        final fn = (x) => x % 2 == 0;
        final result = strain.keep(values, fn);
        final expected = [2];
        expect(result, equals(expected));
      }, skip: false);

      test('keeps strings', () {
        final values = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"];
        final fn = (String x) => x.startsWith('z');
        final result = strain.keep(values, fn);
        final expected = ["zebra", "zombies", "zealot"];
        expect(result, equals(expected));
      }, skip: false);

      test('keeps lists', () {
        final values = [
          [1, 2, 3],
          [5, 5, 5],
          [5, 1, 2],
          [2, 1, 2],
          [1, 5, 2],
          [2, 2, 1],
          [1, 2, 5]
        ];
        final fn = (List<int> x) => x.contains(5);
        final result = strain.keep(values, fn);
        final expected = [
          [5, 5, 5],
          [5, 1, 2],
          [1, 5, 2],
          [1, 2, 5]
        ];
        expect(result, equals(expected));
      }, skip: false);
    });

    group('Discard', () {
      test('discard on empty list returns empty list', () {
        final values = [];
        final fn = (x) => true;
        final result = strain.discard(values, fn);
        final expected = [];
        expect(result, equals(expected));
      }, skip: false);

      test('discards everything', () {
        final values = [1, 3, 5];
        final fn = (x) => true;
        final result = strain.discard(values, fn);
        final expected = [];
        expect(result, equals(expected));
      }, skip: false);

      test('discards nothing', () {
        final values = [1, 3, 5];
        final fn = (x) => false;
        final result = strain.discard(values, fn);
        final expected = [1, 3, 5];
        expect(result, equals(expected));
      }, skip: false);

      test('discards first and last', () {
        final values = [1, 2, 3];
        final fn = (x) => x % 2 == 1;
        final result = strain.discard(values, fn);
        final expected = [2];
        expect(result, equals(expected));
      }, skip: false);

      test('discards neither first nor last', () {
        final values = [1, 2, 3];
        final fn = (x) => x % 2 == 0;
        final result = strain.discard(values, fn);
        final expected = [1, 3];
        expect(result, equals(expected));
      }, skip: false);

      test('discards strings', () {
        final values = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"];
        final fn = (String x) => x.startsWith('z');
        final result = strain.discard(values, fn);
        final expected = ["apple", "banana", "cherimoya"];
        expect(result, equals(expected));
      }, skip: false);

      test('discards lists', () {
        final values = [
          [1, 2, 3],
          [5, 5, 5],
          [5, 1, 2],
          [2, 1, 2],
          [1, 5, 2],
          [2, 2, 1],
          [1, 2, 5]
        ];
        final fn = (List<int> x) => x.contains(5);
        final result = strain.discard(values, fn);
        final expected = [
          [1, 2, 3],
          [2, 1, 2],
          [2, 2, 1]
        ];
        expect(result, equals(expected));
      }, skip: false);
    });
  });
}
