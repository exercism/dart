extension ListOps on List {
  void append<T>(List<T> other) {
    // Add your implemenation here.
  }

  List<T> concat<T>() {
    // Add your implemenation here.
  }

  List<T> filter<T>(bool Function(T elem) predicate) {
    // Add your implemenation here.
  }

  int count() {
    // Add your implemenation here.
  }

  List<T> myMap<T>(T Function(T elem) fn) {
    // Add your implemenation here.
  }

  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
    // Add your implemenation here.
  }

  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
    // Add your implemenation here.
  }

  List<T> reverse<T>() {
    // Add your implemenation here.
  }
}
