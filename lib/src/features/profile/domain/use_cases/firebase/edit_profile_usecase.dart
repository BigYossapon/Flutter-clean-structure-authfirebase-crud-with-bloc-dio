import 'package:apptester/src/features/profile/domain/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:apptester/src/features/profile/domain/repositories/firebase/profile_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditProfileUseCase {
  final ProfileFirebaseRepository profileFirebaseRepository;
  EditProfileUseCase({required this.profileFirebaseRepository});

  Future<void> call(
      String id, RequestEditProfileModel requestEditProfileModel) async {
    return profileFirebaseRepository.editProfile(id, requestEditProfileModel);
  }
}
