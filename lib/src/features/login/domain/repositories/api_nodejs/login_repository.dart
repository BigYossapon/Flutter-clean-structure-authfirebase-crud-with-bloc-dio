import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../models/api_nodejs/request_login_model/request_login_model.dart';
import '../../models/api_nodejs/response_profilelogin_model/response_login_model.dart';

abstract class LoginRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<ResponseLoginModel> loginUser(RequestLoginModel requestLoginModel);
}
