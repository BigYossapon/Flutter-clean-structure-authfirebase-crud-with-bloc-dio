import 'package:apptester/src/features/profile/data/datasources/remote/firebase/profile_firebase_datasource.dart';
import 'package:apptester/src/features/profile/domain/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_firebase_createprofile_model/request_firebase_createprofile_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../domain/models/response_firebase_profile_model/response_firebase_profile_model.dart';

class ProfileFirebaseDatasourceImpl extends ProfileFirebaseDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ProfileFirebaseDatasourceImpl({required this.auth, required this.firestore});
  @override
  Future<void> deleteProfile(String id) async {
    // TODO: implement deleteProfile

    final noteCollectionRef =
        firestore.collection("users").doc(id).collection("notes");

    noteCollectionRef.doc(id).get().then((note) {
      if (note.exists) {
        noteCollectionRef.doc(id).delete();
      }
      return;
    });
  }

  @override
  Future<void> editProfile(
      String id, RequestEditProfileModel requestEditProfileModel) {
    // TODO: implement editProfile

    final editCollectionRef = firestore.collection("users").doc(id);
    return editCollectionRef.update(requestEditProfileModel.toJson());
  }

  @override
  Future<void> createProfile(
      RequestFirebaseCreateProfileModel
          requestFirebaseCreateProfileModel) async {
    // // TODO: implement createProfile
    // final db = FirebaseFirestore.instance;
    // final doc = db.collection("users").doc();

    // await doc.set(requestFirebaseCreateProfileModel.toJson());

    final userCollectionRef =
        firestore.collection("users").doc(requestFirebaseCreateProfileModel.id);

    userCollectionRef.get().then((user) {
      final newUser = RequestFirebaseCreateProfileModel(
              id: requestFirebaseCreateProfileModel.id,
              username: requestFirebaseCreateProfileModel.username,
              password: requestFirebaseCreateProfileModel.password,
              email: requestFirebaseCreateProfileModel.email,
              address: requestFirebaseCreateProfileModel.address,
              country: requestFirebaseCreateProfileModel.country,
              avartar: requestFirebaseCreateProfileModel.avartar)
          .toJson();

      if (!user.exists) {
        userCollectionRef.set(newUser);
      }
      return;
    });
  }

  @override
  Future<void> signout() async {
    // TODO: implement signout
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    await auth.signOut();
  }

  @override
  Future<void> deleteAccount(String id) async {
    // TODO: implement deleteAccount

    auth.currentUser!.delete();
  }

  @override
  Future<ResponseFirebaseProfileModel> getProfile(String id) async {
    // TODO: implement getProfile

    // firestore.collection("users").where(id, isEqualTo: true).get().then(
    //   (querySnapshot) {
    //     print("Successfully completed");
    //     final data = querySnapshot as Map<String, dynamic>;
    //     return data;
    //   },
    //   onError: (e) => print("Error completing: $e"),

    final snapshot =
        await firestore.collection('users').where(id, isEqualTo: id).get();
    final userData = snapshot.docs
        .map((e) =>
            ResponseFirebaseProfileModel.fromJson(e as Map<String, dynamic>))
        .single;
    //final data = snapshot as Map<String, dynamic>;

    return userData;

    // final getCollectionRef = firestore.collection("users").doc(id);

    // return getCollectionRef;
  }
}
