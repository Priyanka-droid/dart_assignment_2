import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
part 'student.g.dart';

// courses available
enum Course { A, B, C, D, E, F }

@JsonSerializable(explicitToJson: true)
class Student extends Comparable {
  String fullName;
  int age;
  Address address;
  int rollNumber;
  Set<Course> courseSet;
  Student(
      {required this.fullName,
      required this.age,
      required this.address,
      required this.rollNumber,
      required this.courseSet});

  // list of students sored by full name and then roll number
  @override
  int compareTo(otherStudent) {
    if (this.fullName.compareTo(otherStudent.fullName) == -1) {
      return -1;
    }

    if (this.fullName.compareTo(otherStudent.fullName) == 1) {
      return 1;
    }
    if (this.fullName.compareTo(otherStudent.fullName) == 0) {
      if (this.rollNumber < otherStudent.rollNumber) return -1;
      if (this.rollNumber >= otherStudent.rollNumber) return 1;
    }
    return 0;
  }

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
