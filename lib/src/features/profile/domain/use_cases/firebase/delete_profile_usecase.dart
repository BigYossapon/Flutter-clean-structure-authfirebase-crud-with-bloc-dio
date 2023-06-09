import '../../models/request_deleteprofile_model/request_deleteprofile_model.dart';
import '../../repositories/firebase/profile_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteProfileUserCase {
  final ProfileFirebaseRepository profileFirebaseRepository;

  DeleteProfileUserCase({required this.profileFirebaseRepository});
  Future<void> call(String id) async {
    return profileFirebaseRepository.deleteProfile(id);
  }
}
