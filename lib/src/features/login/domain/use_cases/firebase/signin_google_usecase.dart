import 'package:injectable/injectable.dart';

import '../../repositories/firebase/login_firebase_repository.dart';

@lazySingleton
class SignInGoogleUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  SignInGoogleUseCase({required this.loginFirebaseRepository});
  Future<void> call() async {
    return loginFirebaseRepository.signinGoogle();
  }
}
