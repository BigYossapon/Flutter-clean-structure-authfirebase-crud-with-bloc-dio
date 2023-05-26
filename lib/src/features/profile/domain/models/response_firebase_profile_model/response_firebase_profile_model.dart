import 'package:json_annotation/json_annotation.dart';
part 'response_firebase_profile_model.g.dart';

@JsonSerializable()
class ResponseFirebaseProfileModel {
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

  ResponseFirebaseProfileModel(
      {this.username,
      this.password,
      this.email,
      this.address,
      this.country,
      this.avartar});

  factory ResponseFirebaseProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseFirebaseProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseFirebaseProfileModelToJson(this);
}
