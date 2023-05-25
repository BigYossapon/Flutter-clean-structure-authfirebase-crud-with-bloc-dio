import 'package:apptester/src/features/profile/data/datasources/remote/firebase/profile_firebase_datasource.dart';
import 'package:apptester/src/features/profile/domain/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_firebase_createprofile_model/request_firebase_createprofile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileFirebaseDatasourceImpl extends ProfileFirebaseDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ProfileFirebaseDatasourceImpl(this.auth, this.firestore);
  @override
  Future<void> deleteProfile(
      String id, RequestDeleteProfileModel requestDeleteProfileModel) {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  Future<void> editProfile(
      String id, RequestEditProfileModel requestEditProfileModel) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<void> createProfile(String id,
      RequestFirebaseCreateProfileModel requestFirebaseCreateProfileModel) {
    // TODO: implement createProfile
    throw UnimplementedError();
  }

  @override
  Future<void> signout() async {
    // TODO: implement signout
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    await auth.signOut();
  }

  @override
  Future<void> deleteAccount(
      String id, RequestDeleteProfileModel requestDeleteProfileModel) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }
}
