import 'dart:collection';

class Forth {
  final _stack = _Stack();

  List<int> get stack => _stack.asList;

  late final flattenDictionary = <String, String>{};

  late final evaluateDictionary = <String, void Function()>{
    '+': addition,
    '-': subtraction,
    '*': multiplication,
    '/': division,
    'dup': dup,
    'drop': drop,
    'swap': swap,
    'over': over,
  };

  void evaluate(String expression) {
    final flat = flatten(expression.toLowerCase());

    if (flat.isEmpty) {
      return;
    }
    final words = flat.split(' ');
    for (final word in words) {
      if (evaluateDictionary.containsKey(word)) {
        evaluateDictionary[word]!.call();
      } else {
        final number = int.parse(word);
        _stack.push(number);
      }
    }
  }

  String flatten(String expression) {
    final words = expression.split(' ');
    for (int t = 0; t < words.length; t++) {
      final word = words[t];
      if (flattenDictionary.containsKey(word)) {
        words[t] = flattenDictionary[word]!;
      } else if (word == ':') {
        final semicolon = words.indexOf(';', t);
        if (semicolon == -1) {
          throw Exception('Unterminated definition');
        }
        defineCommand(words[t + 1], words.sublist(t + 2, semicolon).join(' '));
        words.removeRange(t, semicolon + 1);
        t = semicolon;
      } else if (!evaluateDictionary.containsKey(word) && !isKeyword(word)) {
        throw Exception('Unknown command');
      }
    }
    return words.join(' ');
  }

  /// Must be not a number (-?\d+), not a ':', not a ';'
  static bool isKeyword(String word) => RegExp(r'^(-?\d+|:|;)$').hasMatch(word);

  void defineCommand(String word, String expression) {
    if (isKeyword(word)) {
      throw Exception('Invalid definition');
    }
    flattenDictionary[word] = flatten(expression);
  }

  void addition() {
    final a = _stack.pop();
    final b = _stack.pop();
    _stack.push(b + a);
  }

  void subtraction() {
    final a = _stack.pop();
    final b = _stack.pop();
    _stack.push(b - a);
  }

  void multiplication() {
    final a = _stack.pop();
    final b = _stack.pop();
    _stack.push(b * a);
  }

  void division() {
    final a = _stack.pop();
    if (a == 0) {
      throw Exception('Division by zero');
    }
    final b = _stack.pop();
    _stack.push(b ~/ a);
  }

  void dup() {
    final a = _stack.peek();
    _stack.push(a);
  }

  void drop() {
    _stack.pop();
  }

  void swap() {
    final a = _stack.pop();
    final b = _stack.pop();
    _stack.push(a);
    _stack.push(b);
  }

  void over() {
    final a = _stack.pop();
    final b = _stack.peek();
    _stack.push(a);
    _stack.push(b);
  }
}

class _Stack {
  List<int> get asList => _stack.toList();

  final _stack = Queue<int>();

  bool get isEmpty => _stack.isEmpty;

  int get size => _stack.length;

  int peek() {
    if (_stack.isEmpty) {
      throw Exception('Stack empty');
    }
    return _stack.last;
  }

  int pop() {
    if (_stack.isEmpty) {
      throw Exception('Stack empty');
    }
    return _stack.removeLast();
  }

  void push(int number) {
    _stack.addLast(number);
  }

  void deleteAll({int after = 0}) {
    _stack.take(after);
  }
}
