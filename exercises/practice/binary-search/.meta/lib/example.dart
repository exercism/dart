import 'package:binary_search/value_not_found_exception.dart';

class BinarySearch {
  List<int> items;

  BinarySearch(this.items);

  int find(int item) {
    int i = 0, j = items.length - 1;
    while (i <= j) {
      int mid = (i + j) ~/ 2;
      if (item == items[mid]) {
        return mid;
      } else if (item < items[mid]) {
        j = mid - 1;
      } else {
        i = mid + 1;
      }
    }
    throw ValueNotFoundException("foo bar");
  }
}
