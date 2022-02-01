import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

// address of student
@JsonSerializable()
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
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
