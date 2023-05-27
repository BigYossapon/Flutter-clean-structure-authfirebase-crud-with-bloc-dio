import 'package:apptester/src/features/login/domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@factoryMethod
abstract class LoginFirebaseRepository {
  Future<void> signinEmailPassword(
      RequestLoginFirebaseModel requestLoginFirebaseModel);

  Future<void> signinGoogle();

  Future<void> signinFacebook();

  Future<bool> isSignIn();

  Future<String> getCurrentUId();
}
