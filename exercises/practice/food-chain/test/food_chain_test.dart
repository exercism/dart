import 'package:food_chain/food_chain.dart';
import 'package:test/test.dart';

void main() {
  final foodChain = FoodChain();

  test("fly", () {
    expect(
        foodChain.recite(1, 1),
        equals([
          "I know an old lady who swallowed a fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: false);

  test("spider", () {
    expect(
        foodChain.recite(2, 2),
        equals([
          "I know an old lady who swallowed a spider.",
          "It wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: true);

  test("bird", () {
    expect(
        foodChain.recite(3, 3),
        equals([
          "I know an old lady who swallowed a bird.",
          "How absurd to swallow a bird!",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: true);

  test("cat", () {
    expect(
        foodChain.recite(4, 4),
        equals([
          "I know an old lady who swallowed a cat.",
          "Imagine that, to swallow a cat!",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: true);

  test("dog", () {
    expect(
        foodChain.recite(5, 5),
        equals([
          "I know an old lady who swallowed a dog.",
          "What a hog, to swallow a dog!",
          "She swallowed the dog to catch the cat.",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: true);

  test("goat", () {
    expect(
        foodChain.recite(6, 6),
        equals([
          "I know an old lady who swallowed a goat.",
          "Just opened her throat and swallowed a goat!",
          "She swallowed the goat to catch the dog.",
          "She swallowed the dog to catch the cat.",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: true);

  test("cow", () {
    expect(
        foodChain.recite(7, 7),
        equals([
          "I know an old lady who swallowed a cow.",
          "I don't know how she swallowed a cow!",
          "She swallowed the cow to catch the goat.",
          "She swallowed the goat to catch the dog.",
          "She swallowed the dog to catch the cat.",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: true);

  test("horse", () {
    expect(foodChain.recite(8, 8), equals(["I know an old lady who swallowed a horse.", "She's dead, of course!"]));
  }, skip: true);

  test("multiple verses", () {
    expect(
        foodChain.recite(1, 3),
        equals([
          "I know an old lady who swallowed a fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a spider.",
          "It wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a bird.",
          "How absurd to swallow a bird!",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die."
        ]));
  }, skip: true);

  test("full song", () {
    expect(
        foodChain.recite(1, 8),
        equals([
          "I know an old lady who swallowed a fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a spider.",
          "It wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a bird.",
          "How absurd to swallow a bird!",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a cat.",
          "Imagine that, to swallow a cat!",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a dog.",
          "What a hog, to swallow a dog!",
          "She swallowed the dog to catch the cat.",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a goat.",
          "Just opened her throat and swallowed a goat!",
          "She swallowed the goat to catch the dog.",
          "She swallowed the dog to catch the cat.",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a cow.",
          "I don't know how she swallowed a cow!",
          "She swallowed the cow to catch the goat.",
          "She swallowed the goat to catch the dog.",
          "She swallowed the dog to catch the cat.",
          "She swallowed the cat to catch the bird.",
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
          "She swallowed the spider to catch the fly.",
          "I don't know why she swallowed the fly. Perhaps she'll die.",
          "",
          "I know an old lady who swallowed a horse.",
          "She's dead, of course!"
        ]));
  }, skip: true);
}
