import 'dart:io';

import 'package:apptester/src/features/register/domain/repositories/register_repository.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../domain/models/request_register_model.dart/request_register_model.dart';
import '../datasources/remote/register_apiservice.dart';

@injectable
class RegisterRepositoryimpl extends RegisterRepository {
  late final RegisterApiService _registerApiService;
  // Dio _dio;
  late final Dio _dio;

  RegisterRepositoryimpl() {
    //_loginApiService = LoginApiClient().getService();
    _dio = Dio();
    _registerApiService = RegisterApiService(_dio);

    // EmployeesApiService(_dio);
  }

  @override
  Future<void> registerUser(RequestRegisterModel requestRegisterModel) {
    // TODO: implement registerUser
    return _registerApiService.registerUser(requestRegisterModel);
  }
}
