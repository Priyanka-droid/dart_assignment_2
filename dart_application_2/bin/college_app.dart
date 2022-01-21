import 'dart:io';

import 'student.dart';
import 'task.dart';

class CollegeApp {
  static void startApp() {
    int option;
    // list of students
    List<Student> studentList = [];
    // ask for option until the user selects "Exit"
    do {
      print("chose an option");

      // displays the menu
      print("1: add user details\n2:display user details\n3:" +
          "delete user details\n4:save user details\n5:exit");

      // chose one option from menu
      option = int.parse(stdin.readLineSync()!);

      // perform the task for given option and save the reult in list
      studentList = Task.performTask(option, studentList);

      // sort the list by FullName and then Roll Number
      studentList.sort();
    } while (option != 5);
    print("enter 4 to save, 5 to exit");
    option = int.parse(stdin.readLineSync()!);
    studentList = Task.performTask(option, studentList);
  }
}
