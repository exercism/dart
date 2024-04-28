import 'package:roman_numerals/roman_numerals.dart';
import 'package:test/test.dart';

void main() {
  test("converts 1", () {
    expect(1.toRoman(), equals("I"));
  }, skip: false);

  test("converts 2", () {
    expect(2.toRoman(), equals("II"));
  }, skip: true);

  test("converts 3", () {
    expect(3.toRoman(), equals("III"));
  }, skip: true);

  test("converts 4", () {
    expect(4.toRoman(), equals("IV"));
  }, skip: true);

  test("converts 5", () {
    expect(5.toRoman(), equals("V"));
  }, skip: true);

  test("converts 6", () {
    expect(6.toRoman(), equals("VI"));
  }, skip: true);

  test("converts 9", () {
    expect(9.toRoman(), equals("IX"));
  }, skip: true);

  test("converts 16", () {
    expect(16.toRoman(), equals("XVI"));
  }, skip: true);

  test("converts 27", () {
    expect(27.toRoman(), equals("XXVII"));
  }, skip: true);

  test("converts 48", () {
    expect(48.toRoman(), equals("XLVIII"));
  }, skip: true);

  test("converts 49", () {
    expect(49.toRoman(), equals("XLIX"));
  }, skip: true);

  test("converts 59", () {
    expect(59.toRoman(), equals("LIX"));
  }, skip: true);

  test("converts 66", () {
    expect(66.toRoman(), equals("LXVI"));
  }, skip: true);

  test("converts 93", () {
    expect(93.toRoman(), equals("XCIII"));
  }, skip: true);

  test("converts 141", () {
    expect(141.toRoman(), equals("CXLI"));
  }, skip: true);

  test("converts 163", () {
    expect(163.toRoman(), equals("CLXIII"));
  }, skip: true);

  test("converts 166", () {
    expect(166.toRoman(), equals("CLXVI"));
  }, skip: true);

  test("converts 402", () {
    expect(402.toRoman(), equals("CDII"));
  }, skip: true);

  test("converts 575", () {
    expect(575.toRoman(), equals("DLXXV"));
  }, skip: true);

  test("converts 666", () {
    expect(666.toRoman(), equals("DCLXVI"));
  }, skip: true);

  test("converts 911", () {
    expect(911.toRoman(), equals("CMXI"));
  }, skip: true);

  test("converts 1666", () {
    expect(1666.toRoman(), equals("MDCLXVI"));
  }, skip: true);

  test("converts 1024", () {
    expect(1024.toRoman(), equals("MXXIV"));
  }, skip: true);

  test("converts 3000", () {
    expect(3000.toRoman(), equals("MMM"));
  }, skip: true);

  test("converts 3001", () {
    expect(3001.toRoman(), equals("MMMI"));
  }, skip: true);

  test("converts 3888", () {
    expect(3888.toRoman(), equals("MMMDCCCLXXXVIII"));
  }, skip: true);

  test("converts 3999", () {
    expect(3999.toRoman(), equals("MMMCMXCIX"));
  }, skip: true);
}
