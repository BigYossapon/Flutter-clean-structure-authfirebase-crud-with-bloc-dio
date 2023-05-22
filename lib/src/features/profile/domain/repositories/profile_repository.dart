import 'dart:io';

import 'package:injectable/injectable.dart';

import '../models/request_deleteprofile_model/request_deleteprofile_model.dart';
import '../models/request_editprofile_model/request_editprofile_model.dart';

abstract class ProfileRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<void> editProfile(
      String token, String id, RequestEditProfileModel requestEditProfileModel);

  Future<void> deleteProfile(String token, String id,
      RequestDeleteProfileModel requestDeleteProfileModel);
}
