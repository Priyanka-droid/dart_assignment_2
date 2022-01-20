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
}
