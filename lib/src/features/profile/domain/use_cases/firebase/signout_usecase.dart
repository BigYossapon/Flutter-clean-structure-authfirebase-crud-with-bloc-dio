import '../../repositories/firebase/profile_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignoutUseCase {
  final ProfileFirebaseRepository profileFirebaseRepository;
  SignoutUseCase({required this.profileFirebaseRepository});

  Future<void> call() async {
    return profileFirebaseRepository.signout();
  }
}
