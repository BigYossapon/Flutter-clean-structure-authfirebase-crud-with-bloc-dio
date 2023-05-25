import '../../repositories/firebase/login_firebase_repository.dart';

class IsSignin {
  final LoginFirebaseRepository loginFirebaseRepository;
  IsSignin({required this.loginFirebaseRepository});

  Future<bool> call() async {
    return loginFirebaseRepository.isSignIn();
  }
}
