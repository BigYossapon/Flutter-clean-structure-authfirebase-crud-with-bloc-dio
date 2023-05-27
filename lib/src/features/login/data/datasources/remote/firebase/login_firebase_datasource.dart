import 'package:injectable/injectable.dart';

import '../../../../domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';

@injectable
abstract class LoginFirebaseDataSource {
  Future<void> signinEmailPassword(
      RequestLoginFirebaseModel requestLoginFirebaseModel);

  Future<void> signinGoogle();

  Future<void> signinFacebook();

  Future<bool> isSignIn();

  Future<String> getCurrentUId();
}
