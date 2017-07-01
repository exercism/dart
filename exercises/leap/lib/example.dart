class Year {
  int value;

  Year(int this.value);

  bool isLeap() {
    if (value % 4 != 0) {
      return false;
    }

    return value % 100 != 0 || value % 400 == 0;
  }
}
