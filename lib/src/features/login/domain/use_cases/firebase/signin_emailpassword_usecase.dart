import 'package:apptester/src/features/login/domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';
import 'package:injectable/injectable.dart';
import '../../repositories/firebase/login_firebase_repository.dart';

@lazySingleton
class SignInEmailPasswordUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  SignInEmailPasswordUseCase({required this.loginFirebaseRepository});

  Future<void> call(RequestLoginFirebaseModel requestLoginFirebaseModel) async {
    return loginFirebaseRepository
        .signinEmailPassword(requestLoginFirebaseModel);
  }
}
