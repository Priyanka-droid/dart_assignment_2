import 'student.dart';
import 'task.dart';
import 'util.dart';

class CollegeApp {
  static void startApp() {
    int option;
    // list of students
    List<Student> studentList = [];
    // ask for option until the user selects "Exit"
    do {
      print("chose an option");

      // displays the menu
      Util.displayOption();

      // chose one option from menu
      option = Util.inputOption();

      // perform the task for given option and save the reult in list
      studentList = Task.performTask(option, studentList);

      // sort the list by FullName and then Roll Number
      studentList.sort();
    } while (option != 5);
  }
}
