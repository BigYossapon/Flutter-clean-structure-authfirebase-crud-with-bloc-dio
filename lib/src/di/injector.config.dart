// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/login/domain/repositories/firebase/login_firebase_repository.dart'
    as _i11;
import '../features/login/domain/use_cases/firebase/get_current_uid_usecase.dart'
    as _i10;
import '../features/login/domain/use_cases/firebase/is_signin_usecase.dart'
    as _i13;
import '../features/login/domain/use_cases/firebase/signin_emailpassword_usecase.dart'
    as _i16;
import '../features/login/domain/use_cases/firebase/signin_facebook_usecase.dart'
    as _i17;
import '../features/login/domain/use_cases/firebase/signin_google_usecase.dart'
    as _i18;
import '../features/login/presentation/bloc/auth/auth_bloc.dart' as _i20;
import '../features/profile/domain/repositories/firebase/profile_firebase_repository.dart'
    as _i4;
import '../features/profile/domain/use_cases/firebase/create_profile_usecase.dart'
    as _i3;
import '../features/profile/domain/use_cases/firebase/delete_account_usecase.dart'
    as _i5;
import '../features/profile/domain/use_cases/firebase/delete_profile_usecase.dart'
    as _i6;
import '../features/profile/domain/use_cases/firebase/edit_profile_usecase.dart'
    as _i7;
import '../features/profile/domain/use_cases/firebase/get_profile_usecase.dart'
    as _i12;
import '../features/profile/domain/use_cases/firebase/signout_usecase.dart'
    as _i19;
import '../features/profile/presentation/bloc/profile/profile_bloc.dart'
    as _i21;
import '../features/register/domain/repositories/firebase/register_firebase_repository.dart'
    as _i15;
import '../features/register/domain/use_cases/firebase/register_emailpassword_usecase.dart'
    as _i14;
import '../features/register/presentation/bloc/register/register_bloc.dart'
    as _i22;
import 'injector.dart' as _i23;

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
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.CreateProfileUserCase>(() => _i3.CreateProfileUserCase(
      profileFirebaseRepository: gh<_i4.ProfileFirebaseRepository>()));
  gh.lazySingleton<_i5.DeleteAccountUserCase>(() => _i5.DeleteAccountUserCase(
      profileFirebaseRepository: gh<_i4.ProfileFirebaseRepository>()));
  gh.lazySingleton<_i6.DeleteProfileUserCase>(() => _i6.DeleteProfileUserCase(
      profileFirebaseRepository: gh<_i4.ProfileFirebaseRepository>()));
  gh.lazySingleton<_i7.EditProfileUseCase>(() => _i7.EditProfileUseCase(
      profileFirebaseRepository: gh<_i4.ProfileFirebaseRepository>()));
  gh.factory<_i8.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i9.FirebaseFirestore>(() => appModule.store);
  gh.lazySingleton<_i10.GetCurrentUidUseCase>(() => _i10.GetCurrentUidUseCase(
      loginFirebaseRepository: gh<_i11.LoginFirebaseRepository>()));
  gh.lazySingleton<_i12.GetProfileUseCase>(() => _i12.GetProfileUseCase(
      profileFirebaseRepository: gh<_i4.ProfileFirebaseRepository>()));
  gh.lazySingleton<_i13.IsSigninUseCase>(() => _i13.IsSigninUseCase(
      loginFirebaseRepository: gh<_i11.LoginFirebaseRepository>()));
  gh.lazySingleton<_i14.RegisterEmailPasswordUseCase>(() =>
      _i14.RegisterEmailPasswordUseCase(
          registerFirebaseRepository: gh<_i15.RegisterFirebaseRepository>()));
  gh.lazySingleton<_i16.SignInEmailPasswordUseCase>(() =>
      _i16.SignInEmailPasswordUseCase(
          loginFirebaseRepository: gh<_i11.LoginFirebaseRepository>()));
  gh.lazySingleton<_i17.SignInFacebookUseCase>(() => _i17.SignInFacebookUseCase(
      loginFirebaseRepository: gh<_i11.LoginFirebaseRepository>()));
  gh.lazySingleton<_i18.SignInGoogleUseCase>(() => _i18.SignInGoogleUseCase(
      loginFirebaseRepository: gh<_i11.LoginFirebaseRepository>()));
  gh.lazySingleton<_i19.SignoutUseCase>(() => _i19.SignoutUseCase(
      profileFirebaseRepository: gh<_i4.ProfileFirebaseRepository>()));
  gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
        getCurrentUidUseCase: gh<_i10.GetCurrentUidUseCase>(),
        isSigninUseCase: gh<_i13.IsSigninUseCase>(),
        signInEmailPasswordUseCase: gh<_i16.SignInEmailPasswordUseCase>(),
        signinFacebookUseCase: gh<_i17.SignInFacebookUseCase>(),
        signInGoogleUseCase: gh<_i18.SignInGoogleUseCase>(),
      ));
  gh.factory<_i21.ProfileBloc>(() => _i21.ProfileBloc(
        createProfileUserCase: gh<_i3.CreateProfileUserCase>(),
        deleteAccountUserCase: gh<_i5.DeleteAccountUserCase>(),
        deleteProfileUserCase: gh<_i6.DeleteProfileUserCase>(),
        editProfileUseCase: gh<_i7.EditProfileUseCase>(),
        getProfileUseCase: gh<_i12.GetProfileUseCase>(),
        signOutUseUseCase: gh<_i19.SignoutUseCase>(),
      ));
  gh.factory<_i22.RegisterBloc>(() => _i22.RegisterBloc(
      registerEmailPasswordUseCase: gh<_i14.RegisterEmailPasswordUseCase>()));
  return getIt;
}

class _$AppModule extends _i23.AppModule {}
