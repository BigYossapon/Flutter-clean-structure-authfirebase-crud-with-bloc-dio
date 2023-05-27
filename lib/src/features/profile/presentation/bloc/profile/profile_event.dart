part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class CreateProfileEvent extends ProfileEvent {
  RequestFirebaseCreateProfileModel requestFirebaseCreateProfileModel;
  CreateProfileEvent({required this.requestFirebaseCreateProfileModel});

  @override
  List<Object> get props => [requestFirebaseCreateProfileModel];
}

class DeleteAccountProfileEvent extends ProfileEvent {
  String id;
  DeleteAccountProfileEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class EditProfileEvent extends ProfileEvent {
  RequestEditProfileModel requestEditProfileModel;
  String id;
  EditProfileEvent({required this.requestEditProfileModel, required this.id});
  @override
  List<Object> get props => [requestEditProfileModel, id];
}

class GetProfileEvent extends ProfileEvent {
  String id;
  GetProfileEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class SignOutEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}
