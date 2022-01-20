// ignore_for_file: prefer_function_declarations_over_variables, curly_braces_in_flow_control_structures

import 'dart:io';

import 'student.dart';

class SortItems {
  static Comparator<Student> fullNameComparatorAscending =
      (a, b) => a.fullName.compareTo(b.fullName);

  static Comparator<Student> ageComparatorAscending =
      (a, b) => a.age.compareTo(b.age);
  static Comparator<Student> rollNumberComparatorAscending =
      (a, b) => a.rollNumber.compareTo(b.rollNumber);
  static Comparator<Student> fullNameComparatorDescending =
      (b, a) => a.fullName.compareTo(b.fullName);

  static Comparator<Student> ageComparatorDescending =
      (b, a) => a.age.compareTo(b.age);
  static Comparator<Student> rollNumberComparatorDescending =
      (b, a) => a.rollNumber.compareTo(b.rollNumber);

  static List<Student> sortItems(studentList) {
    print("parameter to sort:\n1:name\n2:roll number\n3:age");
    int sortParameter = int.parse(stdin.readLineSync()!);
    print("order to sort:\n1:ascending\n2:descending");
    int sortOrder = int.parse(stdin.readLineSync()!);
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
      // case 4:
      //   displaySortedAddress()
      default:
        print("enter parameter");
    }
    return studentList;
  }
}
