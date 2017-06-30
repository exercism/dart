class Bob {
  String hey(String message) {
    if (message.trim().isEmpty) {
      return "Fine. Be that way!";
    }

    if (message == message.toUpperCase() && message != message.toLowerCase()) {
      return "Whoa, chill out!";
    }

    if (message.endsWith("?")) {
      return "Sure.";
    }

    return "Whatever.";
  }
}
