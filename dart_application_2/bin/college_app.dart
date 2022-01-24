import 'dart:io';

import 'student.dart';
import 'task.dart';
import 'dart:convert';

import 'validations_util.dart';

class CollegeApp {
  static void startApp() {
    String optionString;
    int option;
    bool exceptionFlag;
    // list of students
    List<Student> studentList = [];
    // file to save student details
    String fileName = "student_details.json";
    File file = new File(fileName);
    // // check if file we want to read exist
    bool fileExist = File("../bin/${fileName}").existsSync();
    // // if file does not exist create the file with empty data
    if (!fileExist) {
      file.writeAsStringSync(jsonEncode([]), mode: FileMode.write);
    }
    // read content of file and save to the list

    String contents = file.readAsStringSync();
    var jsonContent = jsonDecode(contents);
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
        exceptionFlag = false;
        optionString = stdin.readLineSync()!;
        exceptionFlag = ValidationsUtil.validateOption(optionString, 1, 5);
      } while (exceptionFlag);
      option = int.parse(optionString);

      // perform the task for given option and save the reult in list
      studentList = Task.performTask(option, studentList, file);

      // sort the list by FullName and then Roll Number
      studentList.sort();
    } while (option != 5);
  }
}
