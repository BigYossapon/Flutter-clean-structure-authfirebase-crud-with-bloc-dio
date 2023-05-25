// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_firebase_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestFirebaseRegisterModel _$RequestFirebaseRegisterModelFromJson(
        Map<String, dynamic> json) =>
    RequestFirebaseRegisterModel(
      password: json['password'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$RequestFirebaseRegisterModelToJson(
        RequestFirebaseRegisterModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
    };
