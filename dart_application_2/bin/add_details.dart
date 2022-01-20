import 'dart:io';
import 'student.dart';

// take student details as input and return a new student instance
class AddDetails {
  static Student addDetailsOption() {
    print("enter name of student");
    String fullName = stdin.readLineSync()!;
    print("enter age of student");
    int age = int.parse(stdin.readLineSync()!);
    print("enter street number");
    int streetNumber = int.parse(stdin.readLineSync()!);
    print("enter city name");
    String city = stdin.readLineSync()!;
    print("enter district name");
    String district = stdin.readLineSync()!;
    print("enter state name");
    String state = stdin.readLineSync()!;
    Address address = new Address(
        streetNumber: streetNumber,
        city: city,
        district: district,
        state: state);
    print("enter roll number");
    int rollNumber = int.parse(stdin.readLineSync()!);
    Set<Course> courseSet = {};
    print("chose 4 courses from 0,1,2,3,4,5,6");
    while (courseSet.length < 4) {
      int courseNumber = int.parse(stdin.readLineSync()!);
      courseSet.add(Course.values[courseNumber]);
    }
    // ignore: unnecessary_new
    Student student = new Student(
        fullName: fullName,
        age: age,
        address: address,
        rollNumber: rollNumber,
        courseSet: courseSet);
    return student;
  }
}
