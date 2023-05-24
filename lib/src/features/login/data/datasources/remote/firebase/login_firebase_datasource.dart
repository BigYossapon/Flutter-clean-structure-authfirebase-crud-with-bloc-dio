import '../../../../domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';

abstract class LoginFirebaseDataSource {
  Future<void> signinEmailPassword(
      RequestLoginFirebaseModel requestLoginFirebaseModel);

  Future<void> signinGoogle();

  Future<void> signinFacebook();
}
