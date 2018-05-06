import 'dart:math' show pow;

class ArmstrongNumbers {
  /// The parameters and variables within the method that are set to final in order to prevent the accidentally modification of the value.
  /// As those variables are not needed to be changed.
  bool isArmstrongNumber(final int number) {
    final String numberAsString = number.toString();
    final int numOfDigits = numberAsString.length;
    int sum = 0;

    for (int count = 0; count < numOfDigits; count++) {
      final String digitAsString = numberAsString.substring(count, count + 1);
      final int digit = int.parse(digitAsString);
      sum += pow(digit, numOfDigits);
    }

    return number == sum;
  }
}
