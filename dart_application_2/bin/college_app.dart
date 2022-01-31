import 'dart:io';

import 'constants.dart';
import 'student.dart';
import 'task.dart';
import 'dart:convert';
import 'file_io.dart';

import 'validations_util.dart';

class CollegeApp {
  static void startApp() {
    String optionString;
    int option;
    bool exceptionFlag;
    // list of students
    List<Student> studentList = [];
    File file = FileIO.fileCreation();

    var jsonContent = jsonDecode(FileIO.fileRead(file));
    studentList =
        List<Student>.from(jsonContent.map((model) => Student.fromJson(model)));

    // ask for option until the user selects "Exit"
    do {
      do {
        print("chose an option");

        // displays the menu
        print("1: add user details\n2:display user details\n3:" +
            "delete user details\n4:save user details\n5:exit");

        // chose one option from menu
        optionString = stdin.readLineSync()!;
      } while (!ValidationsUtil.validateOption(
          optionString, Constants.RANGE_BEGIN, Constants.RANGE_END));
      option = int.parse(optionString);

      // perform the task for given option and save the reult in list
      studentList = Task.performTask(option, studentList, file);

      // sort the list by FullName and then Roll Number
      studentList.sort();
    } while (option != Constants.RANGE_END);
  }
}
