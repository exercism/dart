num getLength(String input) {
  return input.length;
}

bool isEmptyString(String input) {
  return input.isEmpty;
}

bool isNotEmptyString(String input) {
  return input.isNotEmpty;
}

String concatenate(String firstString, String secondString) {
  return firstString + secondString;
}

String multiply(String input, [int times = 2]) {
  return input * times;
}

String getCharacter(String input, int index) {
  return input[index];
}