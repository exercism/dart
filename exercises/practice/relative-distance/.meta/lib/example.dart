import 'dart:collection';

class RelativeDistance {
  final Map<String, Set<String>> _relatives;

  RelativeDistance(Map<String, List<String>> familyTree) : _relatives = _parseRelatives(familyTree);

  int degreesOfSeparation(String personA, String personB) {
    if (!_relatives.containsKey(personA) || !_relatives.containsKey(personB)) {
      return -1;
    }

    final queue = Queue<({String relative, int degree})>();
    queue.add((relative: personA, degree: 0));
    final visited = <String>{personA};

    while (queue.isNotEmpty) {
      final (:relative, :degree) = queue.removeFirst();

      if (relative == personB) {
        return degree;
      }

      for (final neighbor in _relatives[relative]!) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add((relative: neighbor, degree: degree + 1));
        }
      }
    }

    return -1;
  }

  static Map<String, Set<String>> _parseRelatives(Map<String, List<String>> familyTree) {
    final neighbors = <String, Set<String>>{};

    for (final entry in familyTree.entries) {
      final parent = entry.key;
      final children = entry.value;

      neighbors.putIfAbsent(parent, () => <String>{});
      final parentNeighbors = neighbors[parent]!;

      for (final child in children) {
        neighbors.putIfAbsent(child, () => <String>{});
        final childNeighbors = neighbors[child]!;

        parentNeighbors.add(child);
        childNeighbors.add(parent);

        for (final sibling in children) {
          if (child != sibling) {
            childNeighbors.add(sibling);
          }
        }
      }
    }

    return neighbors;
  }
}
