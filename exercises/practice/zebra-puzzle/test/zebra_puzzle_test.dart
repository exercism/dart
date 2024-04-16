import 'package:test/test.dart';
import 'package:zebra_puzzle/zebra_puzzle.dart';

void main() {
  final zebraPuzzle = ZebraPuzzle();
  zebraPuzzle.solve();

  test('resident who drinks water', () {
    expect(zebraPuzzle.drinksWater, 'Norwegian');
  });

  test('resident who owns zebra', () {
    expect(zebraPuzzle.ownsZebra, 'Japanese');
  });
}
