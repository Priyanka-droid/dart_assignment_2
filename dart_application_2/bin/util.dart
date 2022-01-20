import 'dart:io';

import 'add_details.dart';
import 'display_details.dart';
import 'student.dart';

class Util {
  static int inputOption() {
    int option = int.parse(stdin.readLineSync()!);
    return option;
  }

  static void displayOption() {
    print("1: add user details\n2:display user details\n3:" +
        "delete user details\n4:save user details\n5:exit");
  }

  static List<Student> displaySubOption(int option, List<Student> studentList) {
    switch (option) {
      case 1:
        studentList.add(AddDetails.addDetailsOption());
        break;
      case 2:
        DisplayDetails.displayDetailsOption(studentList);
        break;
      // case 3:
      //   deleteDetailsOption();
      //   break;
      // case 4:
      //   saveDetailsOption();
      //   break;
      // case 5:
      //   exitApp();
      //   break;
    }
    return studentList;
  }
}
