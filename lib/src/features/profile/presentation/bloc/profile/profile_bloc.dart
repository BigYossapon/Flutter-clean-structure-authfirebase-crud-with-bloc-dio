import 'dart:io';

import 'package:apptester/src/features/login/domain/use_cases/firebase/get_current_uid_usecase.dart';
import 'package:apptester/src/features/profile/domain/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/request_firebase_createprofile_model/request_firebase_createprofile_model.dart';
import 'package:apptester/src/features/profile/domain/models/response_firebase_profile_model/response_firebase_profile_model.dart';
import 'package:apptester/src/features/profile/domain/use_cases/firebase/create_profile_usecase.dart';
import 'package:apptester/src/features/profile/domain/use_cases/firebase/delete_account_usecase.dart';
import 'package:apptester/src/features/profile/domain/use_cases/firebase/delete_profile_usecase.dart';
import 'package:apptester/src/features/profile/domain/use_cases/firebase/edit_profile_usecase.dart';
import 'package:apptester/src/features/profile/domain/use_cases/firebase/get_profile_usecase.dart';
import 'package:apptester/src/features/register/presentation/bloc/register/register_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/firebase/signout_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CreateProfileUserCase createProfileUserCase;
  final DeleteAccountUserCase deleteAccountUserCase;
  final DeleteProfileUserCase deleteProfileUserCase;
  final EditProfileUseCase editProfileUseCase;
  final GetProfileUseCase getProfileUseCase;
  final SignoutUseCase signOutUseUseCase;
  ProfileBloc(
      {required this.createProfileUserCase,
      required this.deleteAccountUserCase,
      required this.deleteProfileUserCase,
      required this.editProfileUseCase,
      required this.getProfileUseCase,
      required this.signOutUseUseCase})
      : super(ProfileInitialState()) {
    on<CreateProfileEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileLoadingState());
      try {
        await createProfileUserCase
            .call(event.requestFirebaseCreateProfileModel);
        emit(ProfileSuccessState());
      } on SocketException catch (_) {
        emit(ProfileFailureState());
      } catch (e) {
        emit(ProfileFailureState());
      }
    });

    on<DeleteAccountProfileEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileLoadingState());
      try {
        await deleteProfileUserCase.call(event.id);
        await deleteAccountUserCase.call(event.id);

        emit(ProfileSuccessState());
      } on SocketException catch (_) {
        emit(ProfileFailureState());
      } catch (e) {
        emit(ProfileFailureState());
      }
    });

    on<EditProfileEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileLoadingState());
      try {
        await editProfileUseCase.call(event.id, event.requestEditProfileModel);

        emit(ProfileSuccessState());
      } on SocketException catch (_) {
        emit(ProfileFailureState());
      } catch (e) {
        emit(ProfileFailureState());
      }
    });

    on<GetProfileEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileLoadingState());
      try {
        final profile = await getProfileUseCase.call(event.id);

        emit(ProfileDataSuccessState(responseFirebaseProfileModel: profile));
      } on SocketException catch (_) {
        emit(ProfileFailureState());
      } catch (e) {
        emit(ProfileFailureState());
      }
    });

    on<SignOutEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileLoadingState());
      try {
        await signOutUseUseCase.call();

        emit(ProfileSuccessState());
      } on SocketException catch (_) {
        emit(ProfileFailureState());
      } catch (e) {
        emit(ProfileFailureState());
      }
    });
  }
}
