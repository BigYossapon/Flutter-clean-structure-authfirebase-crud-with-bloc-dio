import '../../repositories/firebase/login_firebase_repository.dart';

class IsSigninUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  IsSigninUseCase({required this.loginFirebaseRepository});

  Future<bool> call() async {
    return loginFirebaseRepository.isSignIn();
  }
}
