import '../../models/request_firebase_register_model/request_firebase_register_model.dart';
import '../../models/request_register_model.dart/request_register_model.dart';

abstract class RegisterFirebaseRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<void> registerEmailPassword(
      RequestFirebaseRegisterModel requestFirebaseRegisterModel);
}
