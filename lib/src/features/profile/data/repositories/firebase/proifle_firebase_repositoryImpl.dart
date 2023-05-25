import 'package:apptester/src/features/profile/domain/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_firebase_createprofile_model/request_firebase_createprofile_model.dart';
import 'package:apptester/src/features/profile/domain/repositories/firebase/profile_firebase_repository.dart';

import '../../../../login/data/datasources/remote/firebase/login_firebase_datasource.dart';
import '../../datasources/remote/firebase/profile_firebase_datasource.dart';

class ProfileFirebaseRepositoryImpl extends ProfileFirebaseRepository {
  final ProfileFirebaseDataSource profileFirebaseDataSource;

  ProfileFirebaseRepositoryImpl(this.profileFirebaseDataSource);
  @override
  Future<void> deleteProfile(
      String id, RequestDeleteProfileModel requestDeleteProfileModel) {
    // TODO: implement deleteProfile
    return profileFirebaseDataSource.deleteProfile(
        id, requestDeleteProfileModel);
  }

  @override
  Future<void> editProfile(
      String id, RequestEditProfileModel requestEditProfileModel) {
    // TODO: implement editProfile
    return profileFirebaseDataSource.editProfile(id, requestEditProfileModel);
  }

  @override
  Future<void> createProfile(String id,
      RequestFirebaseCreateProfileModel requestFirebaseCreateProfileModel) {
    // TODO: implement createProfile
    return profileFirebaseDataSource.createProfile(
        id, requestFirebaseCreateProfileModel);
  }

  @override
  Future<void> signout() {
    // TODO: implement signout
    return profileFirebaseDataSource.signout();
  }

  @override
  Future<void> deleteAccount(
      String id, RequestDeleteProfileModel requestDeleteProfileModel) {
    // TODO: implement deleteAccount
    return profileFirebaseDataSource.deleteAccount(
        id, requestDeleteProfileModel);
  }
}
