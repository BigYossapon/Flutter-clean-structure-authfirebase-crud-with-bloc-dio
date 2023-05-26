import 'package:apptester/src/features/profile/domain/repositories/firebase/profile_firebase_repository.dart';

import '../../models/response_firebase_profile_model/response_firebase_profile_model.dart';

class GetProfileUseCase {
  final ProfileFirebaseRepository profileFirebaseRepository;
  GetProfileUseCase({required this.profileFirebaseRepository});

  Future<ResponseFirebaseProfileModel> call() async {
    return profileFirebaseRepository.getProfile();
  }
}
