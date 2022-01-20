import 'dart:io';

import 'sort_items.dart';
import 'student.dart';

/*  displays details of students
  sort parameter
*/
class DisplayDetails {
  static displayDetailsOption(List<Student> studentList) {
    studentList = SortItems.sortItems(studentList);
    studentList.forEach((student) {
      print("${student.fullName}" +
          "  ${student.rollNumber}  ${student.age}) ${student.address.streetNumber}" +
          "${student.address.city} ${student.address.state}" +
          "${student.courseSet}");
    });
  }
}
