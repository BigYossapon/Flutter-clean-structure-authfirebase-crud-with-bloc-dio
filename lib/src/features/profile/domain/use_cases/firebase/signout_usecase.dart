import '../../repositories/firebase/profile_firebase_repository.dart';

class Signout {
  final ProfileFirebaseRepository profileFirebaseRepository;
  Signout({required this.profileFirebaseRepository});

  Future<void> call() async {
    return profileFirebaseRepository.signout();
  }
}
