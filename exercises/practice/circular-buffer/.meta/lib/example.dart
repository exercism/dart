class EmptyBufferException implements Exception {}

class FullBufferException implements Exception {}

class CircularBuffer {
  final int size;
  final List<int> data = [];
  CircularBuffer(this.size);

  int read() {
    if (data.isEmpty) throw EmptyBufferException();
    return data.removeAt(0);
  }

  void write(int value, {bool force = false}) {
    if (size == data.length) {
      if (force) {
        read();
      } else {
        throw FullBufferException();
      }
    }
    data.add(value);
  }

  void clear() {
    data.clear();
  }
}
