part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SigninEmailPasswordEvent extends AuthEvent {
  RequestLoginFirebaseModel requestLoginFirebaseModel;
  SigninEmailPasswordEvent({required this.requestLoginFirebaseModel});
  @override
  List<Object> get props => [requestLoginFirebaseModel];
}

class SigninGoogleEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class SigninFacebookEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
