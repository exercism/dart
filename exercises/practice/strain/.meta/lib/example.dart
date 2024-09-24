class Strain {
  List<T> keep<T>(List<T> list, bool Function(T) predicate) {
    final result = <T>[];

    for (final item in list) {
      if (predicate(item)) {
        result.add(item);
      }
    }

    return result;
  }

  List<T> discard<T>(List<T> list, bool Function(T) predicate) {
    return keep(list, (item) => !predicate(item));
  }
}
