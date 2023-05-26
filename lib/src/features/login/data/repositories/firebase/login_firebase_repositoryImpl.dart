import 'package:apptester/src/features/login/domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';
import 'package:apptester/src/features/login/domain/repositories/firebase/login_firebase_repository.dart';

import '../../datasources/remote/firebase/login_firebase_datasource.dart';

class LoginFirebaseRepositoryImpl extends LoginFirebaseRepository {
  final LoginFirebaseDataSource loginFirebaseDataSource;

  LoginFirebaseRepositoryImpl({required this.loginFirebaseDataSource});

  @override
  Future<void> signinEmailPassword(
      RequestLoginFirebaseModel requestLoginFirebaseModel) async {
    // TODO: implement signinEmailPassword
    loginFirebaseDataSource.signinEmailPassword(requestLoginFirebaseModel);
  }

  @override
  Future<void> signinFacebook() async {
    // TODO: implement signinFacebook
    loginFirebaseDataSource.signinFacebook();
  }

  @override
  Future<void> signinGoogle() async {
    // TODO: implement signinGoogle
    loginFirebaseDataSource.signinGoogle();
  }

  @override
  Future<String> getCurrentUId() {
    // TODO: implement getCurrentUId
    return loginFirebaseDataSource.getCurrentUId();
  }

  @override
  Future<bool> isSignIn() {
    // TODO: implement isSignIn
    return loginFirebaseDataSource.isSignIn();
  }
}
