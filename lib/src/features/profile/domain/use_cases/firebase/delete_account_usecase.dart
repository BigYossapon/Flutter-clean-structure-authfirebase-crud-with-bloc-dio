import '../../models/request_deleteprofile_model/request_deleteprofile_model.dart';
import '../../repositories/firebase/profile_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteAccountUserCase {
  final ProfileFirebaseRepository profileFirebaseRepository;

  DeleteAccountUserCase({required this.profileFirebaseRepository});
  Future<void> call(String id) async {
    return profileFirebaseRepository.deleteAccount(id);
  }
}
