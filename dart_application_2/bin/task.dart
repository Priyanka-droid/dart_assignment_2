import 'add_details.dart';
import 'display_details.dart';
import 'student.dart';

/*perform task with following options 
    1.  Add details:
    2.  Display details
    3.  Delete details
    4.  Save Details
    5.  Exit
  */
class Task {
  /*performs task on list according to chose menu and returns updated list of students
   */
  static List<Student> performTask(int option, List<Student> studentList) {
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
