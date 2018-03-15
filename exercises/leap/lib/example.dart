class Leap {
  bool leapYear(int year) {
    if (year % 4 != 0) {
      return false;
    }

    return year % 100 != 0 || year % 400 == 0;
  }
}
