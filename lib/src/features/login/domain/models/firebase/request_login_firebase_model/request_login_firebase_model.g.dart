// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_login_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestLoginFirebaseModel _$RequestLoginFirebaseModelFromJson(
        Map<String, dynamic> json) =>
    RequestLoginFirebaseModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RequestLoginFirebaseModelToJson(
        RequestLoginFirebaseModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
