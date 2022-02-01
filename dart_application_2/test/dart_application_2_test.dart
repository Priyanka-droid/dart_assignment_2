import 'package:test/test.dart';
import "../bin/validations_util.dart";
import "../bin/address.dart";
import "../bin/student.dart";
import "../bin/sort_items.dart";

void main() {
  group("validate stings", () {
    test("validate strings with all criteria passing", () {
      bool validate = ValidationsUtil.validateString("String");
      expect(validate, true);
    });
    test("validate strings with empty string", () {
      bool validate = ValidationsUtil.validateString("");
      expect(validate, false);
    });
    test("validate strings with non-alphabets", () {
      bool validate = ValidationsUtil.validateString("strings1");
      expect(validate, false);
    });
    test("validate strings with first letter small", () {
      bool validate = ValidationsUtil.validateString("strings");
      expect(validate, false);
    });
  });

  group("validate age and roll number and street number", () {
    test("validate age,roll,streetNumber with all crieria passing", () {
      bool validate = ValidationsUtil.validateNumber("10");
      expect(validate, true);
    });
    test("validate age,roll, streetNumber with empty string", () {
      bool validate = ValidationsUtil.validateNumber("");
      expect(validate, false);
    });
    test("validate age,roll, streetNumber with non numeric string", () {
      bool validate = ValidationsUtil.validateNumber("age10");
      expect(validate, false);
    });
    test("validate age, roll, streetNumber with non natural string", () {
      bool validate = ValidationsUtil.validateNumber("10.5");
      expect(validate, false);
    });
  });

  group("validate courses", () {
    test("validate courses within range", () {
      bool validate = ValidationsUtil.validateOption("3", 0, 5);
      expect(validate, true);
    });
    test("validate courses for empty entry", () {
      bool validate = ValidationsUtil.validateOption("", 0, 5);
    });
    test("validate courses for non numeric course entry", () {
      bool validate = ValidationsUtil.validateOption("10.5", 0, 5);
      expect(validate, false);
    });
    test("validate course for out of range entry", () {
      bool validate = ValidationsUtil.validateOption("6", 0, 5);
      expect(validate, false);
    });
  });
  group("sort list test", () {
    test("sorting list by name", () {
      List<Student> studentList = [];
      Address address1 = Address(
          streetNumber: 10, city: "City", district: "District", state: "State");
      Student student1 = Student(
          fullName: "Name",
          age: 10,
          address: address1,
          rollNumber: 10,
          courseSet: {Course.A, Course.B, Course.C, Course.D});
      Address address2 = Address(
          streetNumber: 20,
          city: "CityTwo",
          district: "DistrictTwo",
          state: "StateTwo");
      Student student2 = Student(
          fullName: "Kame",
          age: 20,
          address: address1,
          rollNumber: 20,
          courseSet: {Course.A, Course.B, Course.D, Course.E});
      studentList.add(student1);
      studentList.add(student2);
      studentList = SortItems.sortItems(studentList, 1, 1);

      expect(studentList, [student2, student1]);
    });
    test("sorting list by age", () {
      List<Student> studentList = [];
      Address address1 = Address(
          streetNumber: 10, city: "City", district: "District", state: "State");
      Student student1 = Student(
          fullName: "Name",
          age: 10,
          address: address1,
          rollNumber: 10,
          courseSet: {Course.A, Course.B, Course.C, Course.D});
      Address address2 = Address(
          streetNumber: 20,
          city: "CityTwo",
          district: "DistrictTwo",
          state: "StateTwo");
      Student student2 = Student(
          fullName: "Kame",
          age: 20,
          address: address1,
          rollNumber: 20,
          courseSet: {Course.A, Course.B, Course.D, Course.E});
      studentList.add(student1);
      studentList.add(student2);
      studentList = SortItems.sortItems(studentList, 2, 1);

      expect(studentList, [student1, student2]);
    });
  });
}
