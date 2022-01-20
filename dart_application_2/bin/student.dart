class Address {
  int streetNumber;
  String city;
  String district;
  String state;
  Address(
      {required this.streetNumber,
      required this.city,
      required this.district,
      required this.state});
}

enum Course { A, B, C, D, E, F }

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
}
