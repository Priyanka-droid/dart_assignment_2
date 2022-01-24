// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'address.dart';
import 'sort_items.dart';
import 'student.dart';

/*perform task with following options 
      1.  Add details:
      2.  Display details
      3.  Delete details
      4.  Save Details
      5.  Exit
    */
class Task {
  /*  performs task on list according to chosen menu and returns updated 
      list of students
   */
  static List<Student> performTask(
      int option, List<Student> studentList, File file) {
    switch (option) {
      case 1:
        studentList.add(_addDetailsOption());
        break;
      case 2:
        _displayDetailsOption(studentList);
        break;
      case 3:
        studentList = _deleteDetailsOption(studentList);
        break;
      case 4:
        _saveDetailsOption(studentList, file);
        break;
      // case 5:
      //   exitApp();
      //   break;
    }
    return studentList;
  }

  /*
  *take student details as input and return a new student instance
  */

  static Student _addDetailsOption() {
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
    Student student = new Student(
        fullName: fullName,
        age: age,
        address: address,
        rollNumber: rollNumber,
        courseSet: courseSet);
    return student;
  }

  /*  displays details of students based on sort parameter
    */
  static _displayDetailsOption(List<Student> studentList) {
    studentList = SortItems.sortItems(studentList);
    studentList.forEach((student) {
      print("${student.fullName}" +
          " ${student.rollNumber}  ${student.age})" +
          " ${student.address.streetNumber}" +
          "${student.address.city} ${student.address.state}" +
          "${student.courseSet}");
    });
  }

  static List<Student> _deleteDetailsOption(List<Student> studentList) {
    int rollNumber, indexRollNumber;
    if (studentList.isEmpty) {
      print("No element in the list");
      return studentList;
    }
    do {
      print("enter roll number to be deleted");
      rollNumber = int.parse(stdin.readLineSync()!);
      indexRollNumber = studentList
          .indexWhere(((student) => student.rollNumber == rollNumber));
    } while (indexRollNumber == -1);
    studentList.removeAt(indexRollNumber);
    return studentList;
  }

  static _saveDetailsOption(List<Student> studentList, File file) {
    String jsonTags = jsonEncode(studentList);
    file.writeAsStringSync(jsonTags, mode: FileMode.write);
  }
}
