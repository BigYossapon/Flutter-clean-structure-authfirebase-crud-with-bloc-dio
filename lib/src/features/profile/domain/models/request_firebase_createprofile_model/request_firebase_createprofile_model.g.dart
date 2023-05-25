// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_firebase_createprofile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestFirebaseCreateProfileModel _$RequestFirebaseCreateProfileModelFromJson(
        Map<String, dynamic> json) =>
    RequestFirebaseCreateProfileModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      avartar: json['avartar'] as String?,
    );

Map<String, dynamic> _$RequestFirebaseCreateProfileModelToJson(
        RequestFirebaseCreateProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'address': instance.address,
      'country': instance.country,
      'avartar': instance.avartar,
    };
