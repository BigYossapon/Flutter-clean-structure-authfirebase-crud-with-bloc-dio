import 'package:apptester/src/features/login/domain/repositories/firebase/login_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentUidUseCase {
  final LoginFirebaseRepository loginFirebaseRepository;
  GetCurrentUidUseCase({required this.loginFirebaseRepository});

  Future<String> call() async {
    return loginFirebaseRepository.getCurrentUId();
  }
}
