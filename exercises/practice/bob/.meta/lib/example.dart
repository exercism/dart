class Bob {
  String response(String message) {
    if (message.trim().isEmpty) {
      return "Fine. Be that way!";
    }

    if (message == message.toUpperCase() &&
        message != message.toLowerCase() &&
        message.substring(message.length - 1) == '?') {
      return "Calm down, I know what I'm doing!";
    }

    if (message == message.toUpperCase() && message != message.toLowerCase()) {
      return "Whoa, chill out!";
    }

    final RegExp whitespaceEndingQuestion = new RegExp(r'\?[\s]*$');

    if (whitespaceEndingQuestion.hasMatch(message)) {
      return "Sure.";
    }

    return "Whatever.";
  }
}
