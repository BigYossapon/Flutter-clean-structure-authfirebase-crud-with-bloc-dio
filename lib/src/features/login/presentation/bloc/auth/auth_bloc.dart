import 'dart:io';

import 'package:apptester/src/features/login/domain/use_cases/firebase/get_current_uid_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/is_signin_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/signin_emailpassword_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/signin_facebook_usecase.dart';
import 'package:apptester/src/features/login/domain/use_cases/firebase/signin_google_usecase.dart';
import 'package:apptester/src/features/register/domain/models/request_firebase_register_model/request_firebase_register_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/firebase/request_login_firebase_model/request_login_firebase_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final IsSigninUseCase isSigninUseCase;
  final SignInEmailPasswordUseCase signInEmailPasswordUseCase;
  final SignInFacebookUseCase signinFacebookUseCase;
  final SignInGoogleUseCase signInGoogleUseCase;
  AuthBloc(
      {required this.getCurrentUidUseCase,
      required this.isSigninUseCase,
      required this.signInEmailPasswordUseCase,
      required this.signinFacebookUseCase,
      required this.signInGoogleUseCase})
      : super(AuthInitialState()) {
    on<SigninGoogleEvent>((event, emit) async {
      // TODO: implement event handler

      try {
        await signInGoogleUseCase.call();
        final uid = await getCurrentUidUseCase.call();
        emit(AuthenticatedState(id: uid));
      } on SocketException catch (_) {
        emit(UnAuthenticatedState());
      }
    });

    on<SigninEmailPasswordEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        await signInEmailPasswordUseCase.call(event.requestLoginFirebaseModel);
        final uid = await getCurrentUidUseCase.call();
        emit(AuthenticatedState(id: uid));
      } on SocketException catch (_) {
        emit(UnAuthenticatedState());
      }
    });

    on<SigninFacebookEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        await signinFacebookUseCase.call();
        final uid = await getCurrentUidUseCase.call();
        emit(AuthenticatedState(id: uid));
      } on SocketException catch (_) {
        emit(UnAuthenticatedState());
      }
    });

    on<AppStartedEvent>((event, emit) async {
      // TODO: implement event handler

      try {
        final isSignin = await isSigninUseCase.call();
        if (isSignin) {
          final uid = await getCurrentUidUseCase.call();
          emit(AuthenticatedState(id: uid));
        } else {
          emit(UnAuthenticatedState());
        }
      } on SocketException catch (_) {
        emit(UnAuthenticatedState());
      }
    });
  }
}
