import '../../repositories/firebase/profile_firebase_repository.dart';

class SignoutUseCase {
  final ProfileFirebaseRepository profileFirebaseRepository;
  SignoutUseCase({required this.profileFirebaseRepository});

  Future<void> call() async {
    return profileFirebaseRepository.signout();
  }
}
