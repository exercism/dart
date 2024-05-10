import 'package:eliuds_eggs/eliuds_eggs.dart';
import 'package:test/test.dart';

void main() {
  final egg_counter = EggCounter();

  test("0 eggs", () {
    expect(egg_counter.count(0), equals(0));
  }, skip: false);

  test("1 egg", () {
    expect(egg_counter.count(16), equals(1));
  }, skip: false);

  test("4 eggs", () {
    expect(egg_counter.count(89), equals(4));
  }, skip: false);

  test("13 eggs", () {
    expect(egg_counter.count(2000000000), equals(13));
  }, skip: false);
}
