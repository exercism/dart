import 'package:collection/collection.dart';

enum Classification { equal, unequal, sublist, superlist }

class Sublist {
  Function eq = const ListEquality().equals;

  Classification sublist(List<int> listOne, List<int> listTwo) {
    if (listOne.isEmpty && listTwo.isEmpty) {
      return Classification.equal;
    } else if (listOne.isEmpty) {
      return Classification.sublist;
    } else if (listTwo.isEmpty) {
      return Classification.superlist;
    }

    if (isSublist(listOne, listTwo)) {
      return listOne.length < listTwo.length
          ? Classification.sublist
          : Classification.equal;
    }

    if (isSublist(listTwo, listOne)) {
      return listOne.length > listTwo.length
          ? Classification.superlist
          : Classification.equal;
    }

    return Classification.unequal;
  }

  bool isSublist(List<int> listOne, List<int> listTwo) {
    if (listOne.length > listTwo.length) {
      return false;
    }

    for (int i = 0; i <= listTwo.length - listOne.length; i++) {
      final fragment = listTwo.slice(i, i + listOne.length);
      if (eq(fragment, listOne)) {
        return true;
      }
    }

    return false;
  }
}
