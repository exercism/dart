extension ListOps on List {
  void append<T>(List<T> other) {
    for (var elem in other) {
      this.add(elem);
    }
  }

  List<T> concat<T>() {
    var result = <T>[];
    for (var sublist in this) {
      result.addAll(sublist);
    }
    return result;
  }

  List<T> filter<T>(bool Function(T elem) predicate) {
    var result = <T>[];
    for (var elem in this) {
      if (predicate(elem)) {
        result.add(elem);
      }
    }
    return result;
  }

  int count() {
    return this.foldl(0, (len, _) => len + 1);
  }

  List<T> myMap<T>(T Function(T elem) fn) {
    var result = <T>[];
    for (var elem in this) {
      result.add(fn(elem));
    }
    return result;
  }

  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
    var result = initial;
    for (var elem in this) {
      result = fn(result, elem);
    }
    return result;
  }

  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
    var result = initial;
    for (var elem in this.reverse()) {
      result = fn(elem, result);
    }
    return result;
  }

  List<T> reverse<T>() {
    var result = <T>[];
    for (var i = this.length - 1; i >= 0; i--) {
      result.add(this[i]);
    }
    return result;
  }
}
