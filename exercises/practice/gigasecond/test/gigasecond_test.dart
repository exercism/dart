import 'package:gigasecond/gigasecond.dart';
import 'package:test/test.dart';

void main() {
  group('Gigasecond', () {
    test('full time specified', () {
      final moment = DateTime.utc(2015, DateTime.january, 24, 22, 00, 00);
      final result = addGigasecondTo(moment);
      final expected = DateTime.utc(2046, DateTime.october, 02, 23, 46, 40);
      expect(result, equals(expected));
    }, skip: false);

    test('full time with day roll-over', () {
      final moment = DateTime.utc(2015, DateTime.january, 24, 23, 59, 59);
      final result = addGigasecondTo(moment);
      final expected = DateTime.utc(2046, DateTime.october, 03, 01, 46, 39);
      expect(result, equals(expected));
    }, skip: true);
  });
}
