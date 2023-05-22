import 'dart:io';

import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../domain/models/request_login_model/request_login_model.dart';
import '../../domain/models/response_profilelogin_model/response_login_model.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/remote/login_apiservice.dart';

@injectable
class LoginRepositoryimpl extends LoginRepository {
  late final LoginApiService _loginApiService;
  // Dio _dio;
  late final Dio _dio;

  LoginRepositoryimpl() {
    //_loginApiService = LoginApiClient().getService();

    _dio = Dio();
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    _loginApiService = LoginApiService(_dio);

    // EmployeesApiService(_dio);
  }

  // @override
  // Future<List<ResponseLoginModel>> getEmployeeData() {
  //   // TODO: implement getEmployeeData
  //   return _loginApiService.loginUser();
  //   //throw UnimplementedError();
  // }

  @override
  Future<ResponseLoginModel> loginUser(RequestLoginModel requestLoginModel) {
    // TODO: implement postEmployeeData
    return _loginApiService.loginUser(requestLoginModel);

    //throw UnsupportedError;
  }
}
