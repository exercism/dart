typedef Student = (String name, int grade);

class GradeSchool {
  List<Student> students = [];

  List<bool> add(List<Student> newStudents) {
    return newStudents.map(_addStudent).toList();
  }

  bool _addStudent(Student student) {
    if (students.any((s) => s.$1 == student.$1)) {
      return false;
    }
    students.add(student);
    _sort();
    return true;
  }

  void _sort() {
    students.sort((a, b) {
      var result = a.$2.compareTo(b.$2);
      if (result == 0) {
        result = a.$1.compareTo(b.$1);
      }
      return result;
    });
  }

  List<String> roster() {
    return _names(students);
  }

  List<String> grade(int grade) {
    return _names(students.where((student) => student.$2 == grade));
  }

  List<String> _names(Iterable<Student> who) {
    return who.map((student) => student.$1).toList();
  }
}
