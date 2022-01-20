import 'dart:io';

import 'sort_items.dart';
import 'student.dart';

class DisplayDetails {
  static displayDetailsOption(List<Student> studentList) {
    print("parameter to sort");
    int sortParameter = int.parse(stdin.readLineSync()!);
    int sortOrder = int.parse(stdin.readLineSync()!);
    switch (sortParameter) {
      case 1:
        if (sortOrder == 1)
          studentList.sort(SortItems.fullNameComparatorAscending);
        if (sortOrder == 2)
          studentList.sort(SortItems.fullNameComparatorDescending);
        break;
      case 2:
        if (sortOrder == 1)
          studentList.sort(SortItems.rollNumberComparatorAscending);
        if (sortOrder == 2)
          studentList.sort(SortItems.rollNumberComparatorDescending);
        break;
      case 3:
        if (sortOrder == 1) studentList.sort(SortItems.ageComparatorAscending);
        if (sortOrder == 2) studentList.sort(SortItems.ageComparatorDescending);
        break;
      // case 4:
      //   displaySortedAddress()
      default:
        print("enter parameter");
    }
    studentList.forEach((student) {
      print("${student.fullName}" +
          "  ${student.rollNumber}  ${student.age}) ${student.address.streetNumber}" +
          "${student.address.city} ${student.address.state}" +
          "${student.courseSet}");
    });
  }
}
