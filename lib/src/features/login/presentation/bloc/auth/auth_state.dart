part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState {
  String id;
  AuthenticatedState({required this.id});
  @override
  List<Object> get props => [id];
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}
