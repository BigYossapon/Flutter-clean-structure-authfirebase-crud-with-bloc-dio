import 'package:apptester/src/features/login/data/datasources/remote/firebase/login_firebase_datasource.dart';
import 'package:apptester/src/features/login/domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginFirebaseDataSourceImpl extends LoginFirebaseDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  LoginFirebaseDataSourceImpl(this.auth, this.firestore);
  @override
  Future<void> signinEmailPassword(
      RequestLoginFirebaseModel requestLoginFirebaseModel) async {
    // TODO: implement signinEmailPassword
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: requestLoginFirebaseModel.email,
          password: requestLoginFirebaseModel.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> signinFacebook() async {
    // TODO: implement signinFacebook
  }

  @override
  Future<void> signinGoogle() async {
    // TODO: implement signinGoogle

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
