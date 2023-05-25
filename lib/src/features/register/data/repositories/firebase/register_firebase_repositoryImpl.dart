import 'package:apptester/src/features/register/domain/models/request_register_model.dart/request_register_model.dart';
import 'package:apptester/src/features/register/domain/repositories/firebase/register_firebase_repository.dart';

import '../../../domain/models/request_firebase_register_model/request_firebase_register_model.dart';
import '../../datasources/remote/firebase/register_firebase_datasource.dart';

class RegisterFirebaseRepositoryImpl extends RegisterFirebaseRepository {
  final RegisterFirebaseDatasource registerFirebaseDatasource;

  RegisterFirebaseRepositoryImpl(this.registerFirebaseDatasource);
  @override
  Future<void> registerEmailPassword(
      RequestFirebaseRegisterModel requestFirebaseRegisterModel) {
    // TODO: implement registerUser
    return registerFirebaseDatasource
        .registerEmailPassword(requestFirebaseRegisterModel);
  }
}
