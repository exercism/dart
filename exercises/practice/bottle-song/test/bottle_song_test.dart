import 'package:bottle_song/bottle_song.dart';
import 'package:test/test.dart';

void main() {
  final bottleSong = BottleSong();

  group('Bottle Song', () {
    group('verse', () {
      group('single verse', () {
        test('first generic verse', () {
          final result = bottleSong.recite(10, 1);
          expect(
              result,
              equals(<String>[
                'Ten green bottles hanging on the wall,',
                'Ten green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be nine green bottles hanging on the wall."
              ]));
        }, skip: false);

        test('last generic verse', () {
          final result = bottleSong.recite(3, 1);
          expect(
              result,
              equals(<String>[
                'Three green bottles hanging on the wall,',
                'Three green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be two green bottles hanging on the wall."
              ]));
        }, skip: true);

        test('verse with 2 bottles', () {
          final result = bottleSong.recite(2, 1);
          expect(
              result,
              equals(<String>[
                'Two green bottles hanging on the wall,',
                'Two green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be one green bottle hanging on the wall."
              ]));
        }, skip: true);

        test('verse with 1 bottle', () {
          final result = bottleSong.recite(1, 1);
          expect(
              result,
              equals(<String>[
                'One green bottle hanging on the wall,',
                'One green bottle hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be no green bottles hanging on the wall."
              ]));
        }, skip: true);
      });
    });
    group('lyrics', () {
      group('multiple verses', () {
        test('first two verses', () {
          final result = bottleSong.recite(10, 2);
          expect(
              result,
              equals(<String>[
                'Ten green bottles hanging on the wall,',
                'Ten green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be nine green bottles hanging on the wall.",
                '',
                'Nine green bottles hanging on the wall,',
                'Nine green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be eight green bottles hanging on the wall."
              ]));
        }, skip: true);

        test('last three verses', () {
          final result = bottleSong.recite(3, 3);
          expect(
              result,
              equals(<String>[
                'Three green bottles hanging on the wall,',
                'Three green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be two green bottles hanging on the wall.",
                '',
                'Two green bottles hanging on the wall,',
                'Two green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be one green bottle hanging on the wall.",
                '',
                'One green bottle hanging on the wall,',
                'One green bottle hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be no green bottles hanging on the wall."
              ]));
        }, skip: true);

        test('all verses', () {
          final result = bottleSong.recite(10, 10);
          expect(
              result,
              equals(<String>[
                'Ten green bottles hanging on the wall,',
                'Ten green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be nine green bottles hanging on the wall.",
                '',
                'Nine green bottles hanging on the wall,',
                'Nine green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be eight green bottles hanging on the wall.",
                '',
                'Eight green bottles hanging on the wall,',
                'Eight green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be seven green bottles hanging on the wall.",
                '',
                'Seven green bottles hanging on the wall,',
                'Seven green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be six green bottles hanging on the wall.",
                '',
                'Six green bottles hanging on the wall,',
                'Six green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be five green bottles hanging on the wall.",
                '',
                'Five green bottles hanging on the wall,',
                'Five green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be four green bottles hanging on the wall.",
                '',
                'Four green bottles hanging on the wall,',
                'Four green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be three green bottles hanging on the wall.",
                '',
                'Three green bottles hanging on the wall,',
                'Three green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be two green bottles hanging on the wall.",
                '',
                'Two green bottles hanging on the wall,',
                'Two green bottles hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be one green bottle hanging on the wall.",
                '',
                'One green bottle hanging on the wall,',
                'One green bottle hanging on the wall,',
                'And if one green bottle should accidentally fall,',
                "There'll be no green bottles hanging on the wall."
              ]));
        }, skip: true);
      });
    });
  });
}
