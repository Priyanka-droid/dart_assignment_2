import 'dart:io';

import 'add_details.dart';
import 'display_details.dart';
import 'student.dart';

class Util {
  // take input of option
  static int inputOption() {
    int option = int.parse(stdin.readLineSync()!);
    return option;
  }

  // displays all the options
  static void displayOption() {
    print("1: add user details\n2:display user details\n3:" +
        "delete user details\n4:save user details\n5:exit");
  }
}
