import 'package:kindergarten_garden/kindergarten_garden.dart';
import 'package:test/test.dart';

void main() {
  group("partial garden", () {
    test("garden with single student", () {
      final kg = KindergartenGarden("RC\nGG");
      final result = kg.plants(Student.Alice);
      expect(result, equals([Plant.radishes, Plant.clover, Plant.grass, Plant.grass]));
    }, skip: false);

    test("different garden with single student", () {
      final kg = KindergartenGarden("VC\nRC");
      final result = kg.plants(Student.Alice);
      expect(result, equals([Plant.violets, Plant.clover, Plant.radishes, Plant.clover]));
    }, skip: true);

    test("garden with two students", () {
      final kg = KindergartenGarden("VVCG\nVVRC");
      final result = kg.plants(Student.Bob);
      expect(result, equals([Plant.clover, Plant.grass, Plant.radishes, Plant.clover]));
    }, skip: true);

    group("multiple students for the same garden with three students", () {
      test("second student's garden", () {
        final kg = KindergartenGarden("VVCCGG\nVVCCGG");
        final result = kg.plants(Student.Bob);
        expect(result, equals([Plant.clover, Plant.clover, Plant.clover, Plant.clover]));
      }, skip: true);

      test("third student's garden", () {
        final kg = KindergartenGarden("VVCCGG\nVVCCGG");
        final result = kg.plants(Student.Charlie);
        expect(result, equals([Plant.grass, Plant.grass, Plant.grass, Plant.grass]));
      }, skip: true);
    });
  });

  group("full garden", () {
    test("for Alice, first student's garden", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Alice);
      expect(result, equals([Plant.violets, Plant.radishes, Plant.violets, Plant.radishes]));
    }, skip: true);

    test("for Bob, second student's garden", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Bob);
      expect(result, equals([Plant.clover, Plant.grass, Plant.clover, Plant.clover]));
    }, skip: true);

    test("for Charlie", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Charlie);
      expect(result, equals([Plant.violets, Plant.violets, Plant.clover, Plant.grass]));
    }, skip: true);

    test("for David", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.David);
      expect(result, equals([Plant.radishes, Plant.violets, Plant.clover, Plant.radishes]));
    }, skip: true);

    test("for Eve", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Eve);
      expect(result, equals([Plant.clover, Plant.grass, Plant.radishes, Plant.grass]));
    }, skip: true);

    test("for Fred", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Fred);
      expect(result, equals([Plant.grass, Plant.clover, Plant.violets, Plant.clover]));
    }, skip: true);

    test("for Ginny", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Ginny);
      expect(result, equals([Plant.clover, Plant.grass, Plant.grass, Plant.clover]));
    }, skip: true);

    test("for Harriet", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Harriet);
      expect(result, equals([Plant.violets, Plant.radishes, Plant.radishes, Plant.violets]));
    }, skip: true);

    test("for Ileana", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Ileana);
      expect(result, equals([Plant.grass, Plant.clover, Plant.violets, Plant.clover]));
    }, skip: true);

    test("for Joseph", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Joseph);
      expect(result, equals([Plant.violets, Plant.clover, Plant.violets, Plant.grass]));
    }, skip: true);

    test("for Kincaid, second to last student's garden", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Kincaid);
      expect(result, equals([Plant.grass, Plant.clover, Plant.clover, Plant.grass]));
    }, skip: true);

    test("for Larry, last student's garden", () {
      final kg = KindergartenGarden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV");
      final result = kg.plants(Student.Larry);
      expect(result, equals([Plant.grass, Plant.violets, Plant.clover, Plant.violets]));
    }, skip: true);
  });
}
