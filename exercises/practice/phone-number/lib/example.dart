class PhoneNumber {
  /// Returns `String` for a valid number, `null` for invalid.
  String clean(String phoneNumber) {
    /// initialize an empty string.
    String onlyDigits = "";

    /// find all digits.
    Iterable<Match> findDigits = RegExp(r'\d+').allMatches(phoneNumber);
    findDigits.forEach((match) {
      onlyDigits += match.group(0);

      /// remove all digits **for an edge case**.
      phoneNumber = phoneNumber.replaceAll(match.group(0), "");
    });

    if (phoneNumber.contains(RegExp(r'[a-zA-Z]'))) throw FormatException('letters not permitted');

    if (phoneNumber.contains(RegExp(r'!|@'))) throw FormatException('punctuations not permitted');

    if (onlyDigits.length < 10) throw FormatException('incorrect number of digits');

    if (onlyDigits.length > 11) throw FormatException('more than 11 digits');

    if (onlyDigits.length == 11) {
      if (int.parse(onlyDigits[0]) != 1) throw FormatException('11 digits must start with 1');
      if (int.parse(onlyDigits[1]) == 0) throw FormatException('area code cannot start with zero');
      if (int.parse(onlyDigits[1]) == 1) throw FormatException('area code cannot start with one');
      if (int.parse(onlyDigits[4]) == 0) throw FormatException('exchange code cannot start with zero');
      if (int.parse(onlyDigits[4]) == 1) throw FormatException('exchange code cannot start with one');
    }

    if (onlyDigits.length == 10) {
      if (int.parse(onlyDigits[0]) == 0) throw FormatException('area code cannot start with zero');
      if (int.parse(onlyDigits[0]) == 1) throw FormatException('area code cannot start with one');
      if (int.parse(onlyDigits[3]) == 0) throw FormatException('exchange code cannot start with zero');
      if (int.parse(onlyDigits[3]) == 1) throw FormatException('exchange code cannot start with one');
    }

    /// Only these special characters are allowed.
    /// **"." "(" ")" "-" "+" ** and space,
    /// remove these characters.
    phoneNumber = phoneNumber.replaceAll(RegExp(r"^[-.()+\s]*$"), "");

    /// "123-@:!-7890" is invalid, however **"123-@:!-789012"** is valid
    /// by the current logic since the regex grabs all the digits
    /// but "123-@:!-78901256" should be considered as invalid.
    /// hence if anything else still exists its an invalid number.
    if (phoneNumber.length > 0) return null;

    /// remove leading country code **1** to make it easy to process.
    if (onlyDigits.startsWith("1")) {
      onlyDigits = onlyDigits.substring(1);
    }

    if (onlyDigits.length != 10) return null;

    /// after removing the country code if it exists,
    /// first and fourth digits can only range from **2-9**
    /// i.e. Area code and Exchange code.
    RegExp codeRange = RegExp(r'^[2-9]$');
    if (codeRange.hasMatch(onlyDigits[0]) && codeRange.hasMatch(onlyDigits[3])) {
      return onlyDigits;
    }

    /// if a condition isn't accounted for.
    return null;
  }
}
