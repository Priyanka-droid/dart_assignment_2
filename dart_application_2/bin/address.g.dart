// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      streetNumber: json['streetNumber'] as int,
      city: json['city'] as String,
      district: json['district'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'streetNumber': instance.streetNumber,
      'city': instance.city,
      'district': instance.district,
      'state': instance.state,
    };
