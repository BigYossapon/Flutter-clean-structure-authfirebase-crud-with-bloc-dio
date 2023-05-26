import 'dart:io';

import 'package:apptester/src/features/register/domain/models/request_firebase_register_model/request_firebase_register_model.dart';
import 'package:apptester/src/features/register/domain/use_cases/firebase/register_emailpassword_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterEmailPasswordUseCase registerEmailPasswordUseCase;
  RegisterBloc({required this.registerEmailPasswordUseCase})
      : super(RegisterInitialState()) {
    on<RegisterEmailPasswordEvent>((event, emit) async {
      // TODO: implement event handler
      emit(RegisterLoadingState());
      try {
        await registerEmailPasswordUseCase
            .call(event.requestFirebaseRegisterModel);
        emit(RegisterSuccessState());
      } on SocketException catch (_) {
        emit(RegisterFailureState());
      } catch (e) {
        emit(RegisterFailureState());
      }
    });
  }
}
