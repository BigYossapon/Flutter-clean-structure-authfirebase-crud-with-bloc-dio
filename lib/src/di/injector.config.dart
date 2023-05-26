// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apptester/src/features/login/domain/use_cases/firebase/get_current_uid_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/is_signin_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/signin_emailpassword_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/signin_facebook_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/signin_google_usecase.dart';
import 'package:apptester/src/features/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:apptester/src/features/profile/domain/use_cases/firebase/create_profile_usecase.dart';
import 'package:apptester/src/features/profile/domain/use_cases/firebase/delete_account_usecase.dart';
import 'package:apptester/src/features/register/presentation/bloc/register/register_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/login/data/datasources/remote/firebase/login_firebase_datasource.dart';
import '../features/login/data/datasources/remote/firebase/login_firebase_datasource_Impl.dart';
import '../features/login/data/repositories/api_nodejs/login_repositoryImpl.dart'
    as _i3;
import '../features/login/data/repositories/firebase/login_firebase_repositoryImpl.dart';
import '../features/login/domain/repositories/firebase/login_firebase_repository.dart';
import '../features/profile/data/datasources/remote/firebase/profile_firebase_datasource.dart';
import '../features/profile/data/datasources/remote/firebase/profile_firebase_datasource_Impl.dart';
import '../features/profile/data/repositories/api_nodejs/profile_repositoryImpl.dart'
    as _i4;
import '../features/profile/data/repositories/firebase/proifle_firebase_repositoryImpl.dart';
import '../features/profile/domain/repositories/firebase/profile_firebase_repository.dart';
import '../features/profile/domain/use_cases/firebase/delete_profile_usecase.dart';
import '../features/profile/domain/use_cases/firebase/edit_profile_usecase.dart';
import '../features/profile/domain/use_cases/firebase/get_profile_usecase.dart';
import '../features/profile/domain/use_cases/firebase/signout_usecase.dart';
import '../features/profile/presentation/bloc/profile/profile_bloc.dart';
import '../features/register/data/datasources/remote/firebase/register_firebase_datasource.dart';
import '../features/register/data/datasources/remote/firebase/register_firebase_datasource_Impl.dart';
import '../features/register/data/repositories/api_nodejs/register_repositoryImpl.dart'
    as _i5;
import '../features/register/data/repositories/firebase/register_firebase_repositoryImpl.dart';
import '../features/register/domain/repositories/firebase/register_firebase_repository.dart';
import '../features/register/domain/use_cases/firebase/register_emailpassword_usecase.dart';

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

  gh.factory<AuthBloc>(() => AuthBloc(
      getCurrentUidUseCase: gh.call(),
      isSigninUseCase: gh.call(),
      signInEmailPasswordUseCase: gh.call(),
      signinFacebookUseCase: gh.call(),
      signInGoogleUseCase: gh.call()));
  gh.factory<ProfileBloc>(() => ProfileBloc(
      createProfileUserCase: gh.call(),
      deleteAccountUserCase: gh.call(),
      deleteProfileUserCase: gh.call(),
      editProfileUseCase: gh.call(),
      getProfileUseCase: gh.call(),
      signOutUseUseCase: gh.call()));
  gh.factory<RegisterBloc>(
      () => RegisterBloc(registerEmailPasswordUseCase: gh.call()));
  //Cubit/Bloc
  //useCase
  gh.lazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(loginFirebaseRepository: gh.call()));
  gh.lazySingleton<IsSigninUseCase>(
      () => IsSigninUseCase(loginFirebaseRepository: gh.call()));
  gh.lazySingleton<SignInEmailPasswordUseCase>(
      () => SignInEmailPasswordUseCase(loginFirebaseRepository: gh.call()));
  gh.lazySingleton<SignInFacebookUseCase>(
      () => SignInFacebookUseCase(loginFirebaseRepository: gh.call()));
  gh.lazySingleton<SignInGoogleUseCase>(
      () => SignInGoogleUseCase(loginFirebaseRepository: gh.call()));
  gh.lazySingleton<CreateProfileUserCase>(
      () => CreateProfileUserCase(profileFirebaseRepository: gh.call()));
  gh.lazySingleton<DeleteAccountUserCase>(
      () => DeleteAccountUserCase(profileFirebaseRepository: gh.call()));
  gh.lazySingleton<DeleteProfileUserCase>(
      () => DeleteProfileUserCase(profileFirebaseRepository: gh.call()));
  gh.lazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(profileFirebaseRepository: gh.call()));
  gh.lazySingleton<EditProfileUseCase>(
      () => EditProfileUseCase(profileFirebaseRepository: gh.call()));
  gh.lazySingleton<SignoutUseCase>(
      () => SignoutUseCase(profileFirebaseRepository: gh.call()));
  gh.lazySingleton<RegisterEmailPasswordUseCase>(() =>
      RegisterEmailPasswordUseCase(registerFirebaseRepository: gh.call()));

  //repository
  gh.lazySingleton<LoginFirebaseRepository>(
      () => LoginFirebaseRepositoryImpl(loginFirebaseDataSource: gh.call()));
  gh.lazySingleton<RegisterFirebaseRepository>(() =>
      RegisterFirebaseRepositoryImpl(registerFirebaseDatasource: gh.call()));
  gh.lazySingleton<ProfileFirebaseRepository>(() =>
      ProfileFirebaseRepositoryImpl(profileFirebaseDataSource: gh.call()));

  //data source
  gh.lazySingleton<LoginFirebaseDataSource>(
      () => LoginFirebaseDataSourceImpl(auth: gh.call(), firestore: gh.call()));
  gh.lazySingleton<RegisterFirebaseDatasource>(() =>
      RegisterFirebaseDatasourceImpl(auth: gh.call(), firestore: gh.call()));
  gh.lazySingleton<ProfileFirebaseDataSource>(() =>
      ProfileFirebaseDatasourceImpl(auth: gh.call(), firestore: gh.call()));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  gh.lazySingleton(() => auth);
  gh.lazySingleton(() => fireStore);

  gh.factory<_i3.LoginRepositoryimpl>(() => _i3.LoginRepositoryimpl());
  gh.factory<_i4.ProfileRepositoryimpl>(() => _i4.ProfileRepositoryimpl());
  gh.factory<_i5.RegisterRepositoryimpl>(() => _i5.RegisterRepositoryimpl());
  return getIt;
}
