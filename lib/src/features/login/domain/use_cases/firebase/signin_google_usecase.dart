import '../../repositories/firebase/login_firebase_repository.dart';

class SignInGoogleUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  SignInGoogleUseCase({required this.loginFirebaseRepository});
  Future<void> call() async {
    return loginFirebaseRepository.signinGoogle();
  }
}
