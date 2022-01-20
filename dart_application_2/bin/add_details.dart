import 'dart:io';
import 'student.dart';

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
    int rollNumber = int.parse(stdin.readLineSync()!);
    Set<Course> courseSet = {};
    while (courseSet.length < 4) {
      print("chose course");
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
