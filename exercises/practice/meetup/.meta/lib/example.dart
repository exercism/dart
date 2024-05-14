final weekdays = <String, int>{
  "Sunday": DateTime.sunday,
  "Monday": DateTime.monday,
  "Tuesday": DateTime.tuesday,
  "Wednesday": DateTime.wednesday,
  "Thursday": DateTime.thursday,
  "Friday": DateTime.friday,
  "Saturday": DateTime.saturday,
};

final one_day = Duration(days: 1);
final one_week = Duration(days: 7);

class Meetup {
  String meetup({required int year, required int month, required String week, required String dayofweek}) {
    // find the _first_ `dayofweek` of the month
    var date = DateTime.utc(year, month, 1);
    while (date.weekday != weekdays[dayofweek]!) {
      date = date.add(one_day);
    }

    // navigate forward to the wanted week
    switch (week) {
      case "second":
        date = date.add(one_week);
      case "third":
        date = date.add(one_week * 2);
      case "fourth":
        date = date.add(one_week * 3);
      case "teenth":
        date = date.add(one_week);
        if (date.day < 13) {
          date = date.add(one_week);
        }
      case "last":
        var future = date.add(one_week);
        while (future.month == month) {
          date = future;
          future = future.add(one_week);
        }
    }

    return date.ymd();
  }
}

extension DateFormats on DateTime {
  String ymd() {
    var buff = StringBuffer();
    buff.write(this.year);
    buff.write("-");
    buff.write(this.month.toString().padLeft(2, '0'));
    buff.write("-");
    buff.write(this.day.toString().padLeft(2, '0'));
    return buff.toString();
  }
}
