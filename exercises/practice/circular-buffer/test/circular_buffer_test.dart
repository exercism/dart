import 'package:circular_buffer/circular_buffer.dart';
import 'package:test/test.dart';

void main() {
  test("reading empty buffer should fail", () {
    final buff = CircularBuffer(1);
    expect(() => buff.read(), throwsA(isA<EmptyBufferException>()));
  }, skip: false);

  test("can read an item just written", () {
    final buff = CircularBuffer(1);
    buff.write(1);
    var value = buff.read();
    expect(value, 1);
  }, skip: true);

  test("each item may only be read once", () {
    final buff = CircularBuffer(1);
    buff.write(1);
    var value = buff.read();
    expect(value, 1);
    expect(() => buff.read(), throwsA(isA<EmptyBufferException>()));
  }, skip: true);

  test("items are read in the order they are written", () {
    final buff = CircularBuffer(2);
    buff.write(1);
    buff.write(2);
    var value = buff.read();
    expect(value, 1);
    value = buff.read();
    expect(value, 2);
  }, skip: true);

  test("full buffer can't be written to", () {
    final buff = CircularBuffer(1);
    buff.write(1);
    expect(() => buff.write(2), throwsA(isA<FullBufferException>()));
  }, skip: true);

  test("a read frees up capacity for another write", () {
    final buff = CircularBuffer(1);
    buff.write(1);
    var value = buff.read();
    expect(value, 1);
    buff.write(2);
    value = buff.read();
    expect(value, 2);
  }, skip: true);

  test("read position is maintained even across multiple writes", () {
    final buff = CircularBuffer(3);
    buff.write(1);
    buff.write(2);
    var value = buff.read();
    expect(value, 1);
    buff.write(3);
    value = buff.read();
    expect(value, 2);
    value = buff.read();
    expect(value, 3);
  }, skip: true);

  test("items cleared out of buffer can't be read", () {
    final buff = CircularBuffer(1);
    buff.write(1);
    buff.clear();
    expect(() => buff.read(), throwsA(isA<EmptyBufferException>()));
  }, skip: true);

  test("clear frees up capacity for another write", () {
    final buff = CircularBuffer(1);
    buff.write(1);
    buff.clear();
    buff.write(2);
    var value = buff.read();
    expect(value, 2);
  }, skip: true);

  test("clear does nothing on empty buffer", () {
    final buff = CircularBuffer(1);
    buff.clear();
    buff.write(1);
    var value = buff.read();
    expect(value, 1);
  }, skip: true);

  test("overwrite acts like write on non-full buffer", () {
    final buff = CircularBuffer(2);
    buff.write(1);
    buff.write(2, force: true);
    var value = buff.read();
    expect(value, 1);
    value = buff.read();
    expect(value, 2);
  }, skip: true);

  test("overwrite replaces the oldest item on full buffer", () {
    final buff = CircularBuffer(2);
    buff.write(1);
    buff.write(2);
    buff.write(3, force: true);
    var value = buff.read();
    expect(value, 2);
    value = buff.read();
    expect(value, 3);
  }, skip: true);

  test("overwrite replaces the oldest item remaining in buffer following a read", () {
    final buff = CircularBuffer(3);
    buff.write(1);
    buff.write(2);
    buff.write(3);
    var value = buff.read();
    expect(value, 1);
    buff.write(4);
    buff.write(5, force: true);
    value = buff.read();
    expect(value, 3);
    value = buff.read();
    expect(value, 4);
    value = buff.read();
    expect(value, 5);
  }, skip: true);

  test("initial clear does not affect wrapping around", () {
    final buff = CircularBuffer(2);
    buff.clear();
    buff.write(1);
    buff.write(2);
    buff.write(3, force: true);
    buff.write(4, force: true);
    var value = buff.read();
    expect(value, 3);
    value = buff.read();
    expect(value, 4);
    expect(() => buff.read(), throwsA(isA<EmptyBufferException>()));
  }, skip: true);
}
