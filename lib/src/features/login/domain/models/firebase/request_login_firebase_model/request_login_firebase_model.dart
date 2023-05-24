import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'request_login_firebase_model.g.dart';

@JsonSerializable()
class RequestLoginFirebaseModel {
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'password')
  String password;

  RequestLoginFirebaseModel({
    required this.email,
    required this.password,
  });

  factory RequestLoginFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestLoginFirebaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestLoginFirebaseModelToJson(this);
}
