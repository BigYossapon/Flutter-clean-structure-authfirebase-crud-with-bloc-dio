import 'package:apptester/src/features/profile/domain/models/request_firebase_createprofile_model/request_firebase_createprofile_model.dart';

import '../../models/request_deleteprofile_model/request_deleteprofile_model.dart';
import '../../models/request_editprofile_model/request_editprofile_model.dart';

abstract class ProfileFirebaseRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<void> editProfile(
      String id, RequestEditProfileModel requestEditProfileModel);

  Future<void> deleteProfile(
      String id, RequestDeleteProfileModel requestDeleteProfileModel);

  Future<void> createProfile(String id,
      RequestFirebaseCreateProfileModel requestFirebaseCreateProfileModel);

  Future<void> signout();

  Future<void> deleteAccount(
      String id, RequestDeleteProfileModel requestDeleteProfileModel);
}