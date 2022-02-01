// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      fullName: json['fullName'] as String,
      age: json['age'] as int,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      rollNumber: json['rollNumber'] as int,
      courseSet: (json['courseSet'] as List<dynamic>)
          .map((e) => $enumDecode(_$CourseEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'age': instance.age,
      'address': instance.address.toJson(),
      'rollNumber': instance.rollNumber,
      'courseSet': instance.courseSet.map((e) => _$CourseEnumMap[e]).toList(),
    };

const _$CourseEnumMap = {
  Course.A: 'A',
  Course.B: 'B',
  Course.C: 'C',
  Course.D: 'D',
  Course.E: 'E',
  Course.F: 'F',
};
