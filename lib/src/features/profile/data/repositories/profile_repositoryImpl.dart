import 'dart:io';

import 'package:apptester/src/features/profile/domain/repositories/profile_repository.dart';

import 'package:apptester/src/features/register/domain/repositories/register_repository.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../domain/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import '../../domain/models/request_editprofile_model/request_editprofile_model.dart';
import '../datasources/remote/profile_apiservice.dart';

@injectable
class ProfileRepositoryimpl extends ProfileRepository {
  late final ProfileApiService _profileApiService;
  // Dio _dio;
  late final Dio _dio;

  ProfileRepositoryimpl() {
    //_loginApiService = LoginApiClient().getService();
    _dio = Dio();
    _profileApiService = ProfileApiService(_dio);

    // EmployeesApiService(_dio);
  }

  @override
  Future<void> deleteProfile(String token, String id,
      RequestDeleteProfileModel requestDeleteProfileModel) {
    // TODO: implement deleteProfile
    return _profileApiService.deleteProfile(
        token, id, requestDeleteProfileModel);
  }

  @override
  Future<void> editProfile(String token, String id,
      RequestEditProfileModel requestEditProfileModel) {
    // TODO: implement editProfile
    return _profileApiService.editProfile(token, id, requestEditProfileModel);
  }
}
