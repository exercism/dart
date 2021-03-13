class BinarySearchTree<T extends Comparable<T>> {
  /// Root node for the tree.
  final Node<T> root;

  BinarySearchTree(T rootData) : root = new Node<T>(rootData) {
    // Note: [assert] does not run in release mode
  }

  /// Returns an empty `List` if [root] is `null`.
  ///
  /// Otherwise returns data traversed in ascending order.
  Iterable<T> get sortedData sync* {
    for (var t in root.ascendingOrder) yield t;
  }

  /// Returns `true` on success, `false` on failure.
  bool insert(T value) => root.insert(value);
}

class Node<T extends Comparable<T>> {
  /// The actual Data this node holds which should be a [Comparable]
  final T data;

  /// Left node of this node, can be `null`
  Node<T>? left;

  /// Right node of this node, can be `null`
  Node<T>? right;

  Node(this.data, [this.left, this.right]) {
    // Note: [assert] does not run in release mode
  }

  /// This is **inorder** traversal of the tree.
  Iterable<T> get ascendingOrder sync* {
    /// Traverse left sub-tree if it's present
    for (var t in left?.ascendingOrder ?? <T>[]) yield t;

    yield data;

    /// Traverse right sub-tree if it's present
    for (var t in right?.ascendingOrder ?? <T>[]) yield t;
  }

  /// Returns `true` on success, `false` on failure.
  bool insert(T value) {
    /// Insert in left sub-tree if its a smaller or equal number.
    if (value.compareTo(data) <= 0) {
      return left?.insert(value) ?? (left = new Node(value)).data == value;
    }

    /// Insert in right sub-tree if its a greater number.
    return right?.insert(value) ?? (right = new Node(value)).data == value;
  }
}
