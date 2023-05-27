import 'package:apptester/src/features/profile/domain/repositories/firebase/profile_firebase_repository.dart';

import 'package:injectable/injectable.dart';
import '../../models/response_firebase_profile_model/response_firebase_profile_model.dart';

@lazySingleton
class GetProfileUseCase {
  final ProfileFirebaseRepository profileFirebaseRepository;
  GetProfileUseCase({required this.profileFirebaseRepository});

  Future<ResponseFirebaseProfileModel> call(String id) async {
    return profileFirebaseRepository.getProfile(id);
  }
}
