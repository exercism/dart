extension ListOps on List {
  void append<T>(List<T> other) {
    // Add your implementation here.
  }

  List<T> concat<T>() {
    // Add your implementation here.
  }

  List<T> filter<T>(bool Function(T elem) predicate) {
    // Add your implementation here.
  }

  int count() {
    // Add your implementation here.
  }

  List<T> myMap<T>(T Function(T elem) fn) {
    // Add your implementation here.
  }

  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
    // Add your implementation here.
  }

  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
    // Add your implementation here.
  }

  List<T> reverse<T>() {
    // Add your implementation here.
  }
}
