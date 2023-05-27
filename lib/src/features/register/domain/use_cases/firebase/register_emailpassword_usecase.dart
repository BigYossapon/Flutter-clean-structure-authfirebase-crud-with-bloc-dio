import 'package:apptester/src/features/register/domain/models/request_firebase_register_model/request_firebase_register_model.dart';
import 'package:apptester/src/features/register/domain/repositories/firebase/register_firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterEmailPasswordUseCase {
  final RegisterFirebaseRepository registerFirebaseRepository;
  RegisterEmailPasswordUseCase({required this.registerFirebaseRepository});

  Future<void> call(
      RequestFirebaseRegisterModel requestFirebaseRegisterModel) async {
    return registerFirebaseRepository
        .registerEmailPassword(requestFirebaseRegisterModel);
  }
}
