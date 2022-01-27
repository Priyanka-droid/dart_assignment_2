// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'address.dart';
import 'sort_items.dart';
import 'student.dart';
import 'validations_util.dart';

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
    bool exceptionFlag;
    do {
      exceptionFlag = false;
      print("enter name of student");
      fullName = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateString(fullName);
    } while (exceptionFlag);
    do {
      exceptionFlag = false;
      print("enter age of student");
      ageString = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateNumber(ageString);
    } while (exceptionFlag);
    age = int.parse(ageString);
    do {
      exceptionFlag = false;
      print("enter street number");
      streetString = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateNumber(streetString);
    } while (exceptionFlag);
    streetNumber = int.parse(streetString);

    do {
      exceptionFlag = false;
      print("enter city name");
      city = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateString(city);
    } while (exceptionFlag);

    do {
      exceptionFlag = false;
      print("enter district name");
      district = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateString(district);
    } while (exceptionFlag);
    do {
      exceptionFlag = false;
      print("enter state name");
      state = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateString(state);
    } while (exceptionFlag);

    Address address = new Address(
        streetNumber: streetNumber,
        city: city,
        district: district,
        state: state);
    do {
      exceptionFlag = false;
      print("enter roll number");
      rollString = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateNumber(rollString);
     //         TODO: check if the student corresponding to this roll number already exists
    } while (exceptionFlag);
    
    rollNumber = int.parse(rollString);

    Set<Course> courseSet = {};

    while (courseSet.length < 4) {
      exceptionFlag = false;
      print("chose 4 courses from 0,1,2,3,4,5");
      courseString = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateOption(courseString, 0, 5);
      if (exceptionFlag) continue;
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
    studentList = SortItems.sortItems(studentList);
    studentList.forEach((student) {
      print("${student.fullName}" +
          " ${student.rollNumber}  ${student.age})" +
          " ${student.address.streetNumber}" +
          "${student.address.city} ${student.address.state}" +
          "${student.courseSet}");
    });
  }

  /**
   * delete details of student based on given roll
   */
  static List<Student> _deleteDetailsOption(List<Student> studentList) {
    String rollNumberString;
    int rollNumber, indexRollNumber;
    bool exceptionFlag;
    if (studentList.isEmpty) {
      print("No element in the list");
      return studentList;
    }
    do {
      do {
        exceptionFlag = false;
        print("enter roll number to be deleted");
        rollNumberString = stdin.readLineSync()!;
        exceptionFlag = ValidationsUtil.validateNumber(rollNumberString);
      } while (exceptionFlag);
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
    file.writeAsStringSync(jsonTags, mode: FileMode.write);
  }

  /**
   * chose options before closing app:
   * 4: save and close
   * 5: close
   */
  static _exitApp(List<Student> studentList, File file) {
    bool exceptionFlag;
    String optionString;
    do {
      exceptionFlag = false;
      print("enter 4 to save, 5 to exit");
      optionString = stdin.readLineSync()!;
      exceptionFlag = ValidationsUtil.validateOption(optionString, 4, 5);
      int option = int.parse(optionString);
    } while (exceptionFlag);
    switch (optionString) {
      case "4":
        _saveDetailsOption(studentList, file);
        break;
      case "5":
        print("closing the app");
        break;
      default:
        print("enter valid option");
    }
    return;
  }
}
