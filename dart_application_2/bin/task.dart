// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'address.dart';
import 'constants.dart';
import 'sort_items.dart';
import 'student.dart';
import 'validations_util.dart';
import 'file_io.dart';
import 'package:dolumns/dolumns.dart';

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
        studentList = deleteDetailsOption(studentList);
        break;
      case 4:
        _saveDetailsOption(studentList, file);
        break;
      case 5:
        _exitApp(studentList, file);
        break;
      default:
        print("enter valid option");
    }
    return studentList;
  }

  /*
  *take student details as input and return a new student instance
  */

  static Student _addDetailsOption() {
    String fullName,
        ageString,
        streetString,
        city,
        district,
        state,
        rollString,
        courseString;
    int age, rollNumber, streetNumber;
    do {
      print("enter name of student");
      fullName = stdin.readLineSync()!;
    } while (!ValidationsUtil.validateString(fullName));
    do {
      print("enter age of student");
      ageString = stdin.readLineSync()!;
    } while (!ValidationsUtil.validateNumber(ageString));
    age = int.parse(ageString);
    do {
      print("enter street number");
      streetString = stdin.readLineSync()!;
    } while (!ValidationsUtil.validateNumber(streetString));
    streetNumber = int.parse(streetString);

    do {
      print("enter city name");
      city = stdin.readLineSync()!;
    } while (!ValidationsUtil.validateString(city));

    do {
      print("enter district name");
      district = stdin.readLineSync()!;
    } while (!ValidationsUtil.validateString(district));
    do {
      print("enter state name");
      state = stdin.readLineSync()!;
    } while (!ValidationsUtil.validateString(state));

    Address address = new Address(
        streetNumber: streetNumber,
        city: city,
        district: district,
        state: state);
    do {
      print("enter roll number");
      rollString = stdin.readLineSync()!;
    } while (!ValidationsUtil.validateNumber(rollString));
    rollNumber = int.parse(rollString);

    Set<Course> courseSet = {};

    while (courseSet.length < Constants.COURSES) {
      print("chose 4 courses from 0,1,2,3,4,5");
      courseString = stdin.readLineSync()!;
      if (!ValidationsUtil.validateOption(courseString,
          Constants.COURSE_RANGE_BEGIN, Constants.COURSE_RANGE_END)) continue;
      int courseNumber = int.parse(courseString);
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
    //  REQUIRES VALIDATION
    print("parameter to sort:\n1:name\n2:roll number\n3:age");
    int sortParameter = int.parse(stdin.readLineSync()!);
    print("order to sort:\n1:ascending\n2:descending");
    //  REQUIRES VALIDATION
    int sortOrder = int.parse(stdin.readLineSync()!);
    studentList = SortItems.sortItems(studentList, sortParameter, sortOrder);
    final String _fields = "Name \t Roll Number \t Age \t Address \t Courses";
    print(_fields);
    final String _seperator =
        "__________________________________________________________";

    studentList.forEach((student) {
      print(
          "${student.fullName} \t ${student.rollNumber} \t\t ${student.age} \t ${student.address} \t ${student.courseSet}");
    });
  }

  /**
   * delete details of student based on given roll
   */
  static List<Student> deleteDetailsOption(List<Student> studentList) {
    String rollNumberString;
    int rollNumber, indexRollNumber;
    if (studentList.isEmpty) {
      print("No element in the list");
      return studentList;
    }
    do {
      do {
        print("enter roll number to be deleted");
        rollNumberString = stdin.readLineSync()!;
      } while (!ValidationsUtil.validateNumber(rollNumberString));
      rollNumber = int.parse(rollNumberString);
      indexRollNumber = studentList
          .indexWhere(((student) => student.rollNumber == rollNumber));
    } while (indexRollNumber == -1);
    studentList.removeAt(indexRollNumber);
    return studentList;
  }

  /**
   * save details from in-memory to disk
   */
  static _saveDetailsOption(List<Student> studentList, File file) {
    String jsonTags = jsonEncode(studentList);
    FileIO.fileWrite(jsonTags, file);
  }

  /**
   * chose options before closing app:
   * 4: save and close
   * 5: close
   */
  static _exitApp(List<Student> studentList, File file) {
    String optionString;
    print("Do you want to save the details? enter 'yes' to save.");
    optionString = stdin.readLineSync()!;
    if (optionString == "yes")
      _saveDetailsOption(studentList, file);
    else
      print("closing the app");
    return;
  }
}
