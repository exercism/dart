import 'dart:collection';

class BracketPush {
  bool isPaired(String input) {
    ListQueue<String> stack = new ListQueue(input.length);

    for (String char in input.split('')) {
      if (char == '(' || char == '{' || char == '[') {
        stack.add(char);
      } else if (char == ')' || char == '}' || char == ']') {
        if (stack.isEmpty || !_areMatching(stack.last, char)) {
          return false;
        } else {
          stack.removeLast();
        }
      }
    }

    return stack.isEmpty;
  }

  bool _areMatching(String opening, String closing) {
    if (opening == '(' && closing == ')')
      return true;
    else if (opening == '{' && closing == '}')
      return true;
    else if (opening == '[' && closing == ']') return true;
    return false;
  }
}
