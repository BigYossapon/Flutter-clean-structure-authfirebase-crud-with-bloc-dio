// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/login/data/repositories/api_nodejs/login_repositoryImpl.dart'
    as _i3;
import '../features/profile/data/repositories/api_nodejs/profile_repositoryImpl.dart'
    as _i4;
import '../features/register/data/repositories/api_nodejs/register_repositoryImpl.dart'
    as _i5;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.LoginRepositoryimpl>(() => _i3.LoginRepositoryimpl());
  gh.factory<_i4.ProfileRepositoryimpl>(() => _i4.ProfileRepositoryimpl());
  gh.factory<_i5.RegisterRepositoryimpl>(() => _i5.RegisterRepositoryimpl());
  return getIt;
}
