import 'package:json_annotation/json_annotation.dart';

part 'request_firebase_register_model.g.dart';

@JsonSerializable()
class RequestFirebaseRegisterModel {
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'email')
  String email;

  RequestFirebaseRegisterModel({
    required this.password,
    required this.email,
  });

  factory RequestFirebaseRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RequestFirebaseRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestFirebaseRegisterModelToJson(this);
}
