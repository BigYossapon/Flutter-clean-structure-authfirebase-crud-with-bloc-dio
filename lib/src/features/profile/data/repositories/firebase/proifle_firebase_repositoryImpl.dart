import 'package:apptester/src/features/profile/domain/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_firebase_createprofile_model/request_firebase_createprofile_model.dart';

import 'package:apptester/src/features/profile/domain/repositories/firebase/profile_firebase_repository.dart';

import '../../../../login/data/datasources/remote/firebase/login_firebase_datasource.dart';
import '../../../domain/models/response_firebase_profile_model/response_firebase_profile_model.dart';
import '../../datasources/remote/firebase/profile_firebase_datasource.dart';

class ProfileFirebaseRepositoryImpl extends ProfileFirebaseRepository {
  final ProfileFirebaseDataSource profileFirebaseDataSource;

  ProfileFirebaseRepositoryImpl({required this.profileFirebaseDataSource});
  @override
  Future<void> deleteProfile(String id) {
    // TODO: implement deleteProfile
    return profileFirebaseDataSource.deleteProfile(id);
  }

  @override
  Future<void> editProfile(
      String id, RequestEditProfileModel requestEditProfileModel) {
    // TODO: implement editProfile
    return profileFirebaseDataSource.editProfile(id, requestEditProfileModel);
  }

  @override
  Future<void> createProfile(
      RequestFirebaseCreateProfileModel requestFirebaseCreateProfileModel) {
    // TODO: implement createProfile
    return profileFirebaseDataSource
        .createProfile(requestFirebaseCreateProfileModel);
  }

  @override
  Future<void> signout() {
    // TODO: implement signout
    return profileFirebaseDataSource.signout();
  }

  @override
  Future<void> deleteAccount(String id) {
    // TODO: implement deleteAccount
    return profileFirebaseDataSource.deleteAccount(id);
  }

  @override
  Future<ResponseFirebaseProfileModel> getProfile() {
    // TODO: implement getProfile
    return profileFirebaseDataSource.getProfile();
  }
}
