import 'student.dart';
import 'util.dart';

class CollegeApp {
  static void startApp() {
    int option;
    List<Student> studentList = [];
    do {
      print("chose an option");
      Util.displayOption();
      option = Util.inputOption();
      studentList = Util.displaySubOption(option, studentList);
      studentList.sort();
    } while (option != 5);
  }
}
