import 'package:apptester/src/features/login/domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';

import '../../repositories/firebase/login_firebase_repository.dart';

class SignInEmailPasswordUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  SignInEmailPasswordUseCase({required this.loginFirebaseRepository});

  Future<void> call(RequestLoginFirebaseModel requestLoginFirebaseModel) async {
    return loginFirebaseRepository
        .signinEmailPassword(requestLoginFirebaseModel);
  }
}
