import 'package:apptester/src/features/register/data/datasources/remote/firebase/register_firebase_datasource.dart';
import 'package:apptester/src/features/register/domain/models/request_firebase_register_model/request_firebase_register_model.dart';
import 'package:apptester/src/features/register/domain/models/request_register_model.dart/request_register_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterFirebaseDatasourceImpl extends RegisterFirebaseDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  RegisterFirebaseDatasourceImpl(this.auth, this.firestore);

  @override
  Future<void> registerEmailPassword(
      RequestFirebaseRegisterModel requestFirebaseRegisterModel) async {
    // TODO: implement registerEmailPassword
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: requestFirebaseRegisterModel.email,
        password: requestFirebaseRegisterModel.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
