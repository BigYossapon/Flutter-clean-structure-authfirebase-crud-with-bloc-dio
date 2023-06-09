import 'package:apptester/src/features/profile/domain/models/request_firebase_createprofile_model/request_firebase_createprofile_model.dart';
import 'package:apptester/src/features/profile/domain/repositories/firebase/profile_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateProfileUserCase {
  final ProfileFirebaseRepository profileFirebaseRepository;

  CreateProfileUserCase({required this.profileFirebaseRepository});
  Future<void> call(
      RequestFirebaseCreateProfileModel
          requestFirebaseCreateProfileModel) async {
    return profileFirebaseRepository
        .createProfile(requestFirebaseCreateProfileModel);
  }
}
