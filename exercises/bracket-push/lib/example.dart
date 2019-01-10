import 'dart:collection';

class BracketPush {
  bool isPaired(String input) {
    ListQueue<String> stack = new ListQueue(input.length);

    for (int i = 0; i < input.length; i++) {
      if (input[i] == '(' || input[i] == '{' || input[i] == '[') {
        stack.add(input[i]);
      } else if (input[i] == ')' || input[i] == '}' || input[i] == ']') {
        if (stack.isEmpty || !areMatching(stack.last, input[i])) {
          return false;
        } else {
          stack.removeLast();
        }
      }
    }

    return stack.isEmpty;
  }

  bool areMatching(String opening, String closing) {
    if (opening == '(' && closing == ')')
      return true;
    else if (opening == '{' && closing == '}')
      return true;
    else if (opening == '[' && closing == ']') return true;
    return false;
  }
}
