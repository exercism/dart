import 'package:grade_school/grade_school.dart';
import 'package:test/test.dart';

void main() {
  test("Roster is empty when no student is added", () {
    final grade_school = GradeSchool();
    expect(grade_school.roster(), equals([]));
  }, skip: false);

  test("Add a student", () {
    final grade_school = GradeSchool();
    final result = grade_school.add([("Aimee", 2)]);
    expect(result, equals([true]));
  }, skip: false);

  test("Student is added to the roster", () {
    final grade_school = GradeSchool();
    grade_school.add([("Aimee", 2)]);
    expect(grade_school.roster(), equals(["Aimee"]));
  }, skip: false);

  test("Adding multiple students in the same grade in the roster", () {
    final grade_school = GradeSchool();
    final result = grade_school.add([("Blair", 2), ("James", 2), ("Paul", 2)]);
    expect(result, equals([true, true, true]));
  }, skip: false);

  test("Multiple students in the same grade are added to the roster", () {
    final grade_school = GradeSchool();
    grade_school.add([("Blair", 2), ("James", 2), ("Paul", 2)]);
    expect(grade_school.roster(), equals(["Blair", "James", "Paul"]));
  }, skip: false);

  test("Cannot add student to same grade in the roster more than once", () {
    final grade_school = GradeSchool();
    final result = grade_school.add([("Blair", 2), ("James", 2), ("James", 2), ("Paul", 2)]);
    expect(result, equals([true, true, false, true]));
  }, skip: false);

  test("Student not added to same grade in the roster more than once", () {
    final grade_school = GradeSchool();
    grade_school.add([("Blair", 2), ("James", 2), ("James", 2), ("Paul", 2)]);
    expect(grade_school.roster(), equals(["Blair", "James", "Paul"]));
  }, skip: false);

  test("Adding students in multiple grades", () {
    final grade_school = GradeSchool();
    final result = grade_school.add([("Chelsea", 3), ("Logan", 7)]);
    expect(result, equals([true, true]));
  }, skip: false);

  test("Students in multiple grades are added to the roster", () {
    final grade_school = GradeSchool();
    grade_school.add([("Chelsea", 3), ("Logan", 7)]);
    expect(grade_school.roster(), equals(["Chelsea", "Logan"]));
  }, skip: false);

  test("Cannot add same student to multiple grades in the roster", () {
    final grade_school = GradeSchool();
    final result = grade_school.add([("Blair", 2), ("James", 2), ("James", 3), ("Paul", 3)]);
    expect(result, equals([true, true, false, true]));
  }, skip: false);

  test("Student not added to multiple grades in the roster", () {
    final grade_school = GradeSchool();
    grade_school.add([("Blair", 2), ("James", 2), ("James", 3), ("Paul", 3)]);
    expect(grade_school.roster(), equals(["Blair", "James", "Paul"]));
  }, skip: false);

  test("Students are sorted by grades in the roster", () {
    final grade_school = GradeSchool();
    grade_school.add([("Jim", 3), ("Peter", 2), ("Anna", 1)]);
    expect(grade_school.roster(), equals(["Anna", "Peter", "Jim"]));
  }, skip: false);

  test("Students are sorted by name in the roster", () {
    final grade_school = GradeSchool();
    grade_school.add([("Peter", 2), ("Zoe", 2), ("Alex", 2)]);
    expect(grade_school.roster(), equals(["Alex", "Peter", "Zoe"]));
  }, skip: false);

  test("Students are sorted by grades and then by name in the roster", () {
    final grade_school = GradeSchool();
    grade_school.add([("Peter", 2), ("Anna", 1), ("Barb", 1), ("Zoe", 2), ("Alex", 2), ("Jim", 3), ("Charlie", 1)]);
    expect(grade_school.roster(), equals(["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]));
  }, skip: false);

  test("Grade is empty if no students in the roster", () {
    final grade_school = GradeSchool();
    expect(grade_school.grade(1), equals([]));
  }, skip: false);

  test("Grade is empty if no students in that grade", () {
    final grade_school = GradeSchool();
    grade_school.add([("Peter", 2), ("Zoe", 2), ("Alex", 2), ("Jim", 3)]);
    expect(grade_school.grade(1), equals([]));
  }, skip: false);

  test("Student not added to same grade more than once", () {
    final grade_school = GradeSchool();
    grade_school.add([("Blair", 2), ("James", 2), ("James", 2), ("Paul", 2)]);
    expect(grade_school.grade(2), equals(["Blair", "James", "Paul"]));
  }, skip: false);

  test("Student not added to multiple grades", () {
    final grade_school = GradeSchool();
    grade_school.add([("Blair", 2), ("James", 2), ("James", 3), ("Paul", 3)]);
    expect(grade_school.grade(2), equals(["Blair", "James"]));
  }, skip: false);

  test("Student not added to other grade for multiple grades", () {
    final grade_school = GradeSchool();
    grade_school.add([("Blair", 2), ("James", 2), ("James", 3), ("Paul", 3)]);
    expect(grade_school.grade(3), equals(["Paul"]));
  }, skip: false);

  test("Students are sorted by name in a grade", () {
    final grade_school = GradeSchool();
    grade_school.add([("Franklin", 5), ("Bradley", 5), ("Jeff", 1)]);
    expect(grade_school.grade(5), equals(["Bradley", "Franklin"]));
  }, skip: false);
}
