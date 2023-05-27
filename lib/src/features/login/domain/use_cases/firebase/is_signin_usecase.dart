import '../../repositories/firebase/login_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IsSigninUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  IsSigninUseCase({required this.loginFirebaseRepository});

  Future<bool> call() async {
    return loginFirebaseRepository.isSignIn();
  }
}
