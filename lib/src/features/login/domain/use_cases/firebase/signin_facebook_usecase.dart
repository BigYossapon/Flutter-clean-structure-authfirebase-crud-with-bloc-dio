import '../../repositories/firebase/login_firebase_repository.dart';

class SignInFacebookUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  SignInFacebookUseCase({required this.loginFirebaseRepository});

  Future<void> call() async {
    return loginFirebaseRepository.signinFacebook();
  }
}
