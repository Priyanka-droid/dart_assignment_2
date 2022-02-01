import 'dart:io';

import 'student.dart';

class SortItems {
  // sort by Full name in ascending order
  static Comparator<Student> fullNameComparatorAscending =
      (a, b) => a.fullName.compareTo(b.fullName);
  // sort by age in descending order
  static Comparator<Student> ageComparatorAscending =
      (a, b) => a.age.compareTo(b.age);
  // sort by roll number in ascending order
  static Comparator<Student> rollNumberComparatorAscending =
      (a, b) => a.rollNumber.compareTo(b.rollNumber);
  // sort by full name in descending order
  static Comparator<Student> fullNameComparatorDescending =
      (b, a) => a.fullName.compareTo(b.fullName);
  // sort by age in descending order
  static Comparator<Student> ageComparatorDescending =
      (b, a) => a.age.compareTo(b.age);
  // sort by roll number in descending order
  static Comparator<Student> rollNumberComparatorDescending =
      (b, a) => a.rollNumber.compareTo(b.rollNumber);

  static List<Student> sortItems(
      List<Student> studentList, int sortParameter, int sortOrder) {
    switch (sortParameter) {
      case 1:
        if (sortOrder == 1) studentList.sort(fullNameComparatorAscending);
        if (sortOrder == 2) studentList.sort(fullNameComparatorDescending);
        break;
      case 2:
        if (sortOrder == 1) studentList.sort(rollNumberComparatorAscending);
        if (sortOrder == 2) studentList.sort(rollNumberComparatorDescending);
        break;
      case 3:
        if (sortOrder == 1) studentList.sort(ageComparatorAscending);
        if (sortOrder == 2) studentList.sort(ageComparatorDescending);
        break;
      default:
        print("enter parameter");
    }
    return studentList;
  }
}
