import 'package:json_annotation/json_annotation.dart';
part 'request_firebase_createprofile_model.g.dart';

@JsonSerializable()
class RequestFirebaseCreateProfileModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'avartar')
  String? avartar;

  RequestFirebaseCreateProfileModel(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.address,
      this.country,
      this.avartar});

  factory RequestFirebaseCreateProfileModel.fromJson(
          Map<String, dynamic> json) =>
      _$RequestFirebaseCreateProfileModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RequestFirebaseCreateProfileModelToJson(this);
}
