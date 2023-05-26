// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_firebase_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseFirebaseProfileModel _$ResponseFirebaseProfileModelFromJson(
        Map<String, dynamic> json) =>
    ResponseFirebaseProfileModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      avartar: json['avartar'] as String?,
    );

Map<String, dynamic> _$ResponseFirebaseProfileModelToJson(
        ResponseFirebaseProfileModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'address': instance.address,
      'country': instance.country,
      'avartar': instance.avartar,
    };
