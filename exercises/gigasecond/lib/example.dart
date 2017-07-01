class Gigasecond {
  DateTime birthDate;

  Gigasecond(DateTime this.birthDate);

  DateTime date() => birthDate.add(new Duration(seconds: 1000000000));
}
