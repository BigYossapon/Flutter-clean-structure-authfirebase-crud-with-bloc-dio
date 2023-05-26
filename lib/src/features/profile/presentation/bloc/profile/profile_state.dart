part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileFailureState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccessState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileDataSuccessState extends ProfileState {
  ResponseFirebaseProfileModel responseFirebaseProfileModel;
  ProfileDataSuccessState({required this.responseFirebaseProfileModel});
  @override
  List<Object> get props => [responseFirebaseProfileModel];
}
