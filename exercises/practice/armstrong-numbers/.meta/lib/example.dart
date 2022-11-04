import 'dart:math' show pow;

class ArmstrongNumbers {
  /// The parameters and variables within the method that are set to final in order to prevent the accidentally modification of the value.
  /// As those variables are not needed to be changed.
  bool isArmstrongNumber(final String input) {
    final numOfDigits = input.length;
    var sum = BigInt.from(0);

    for (var count = 0; count < numOfDigits; count++) {
      final digitAsString = input.substring(count, count + 1);
      final digit = BigInt.parse(digitAsString);
      sum += digit.pow(numOfDigits);
    }

    return input == sum.toString();
  }
}
