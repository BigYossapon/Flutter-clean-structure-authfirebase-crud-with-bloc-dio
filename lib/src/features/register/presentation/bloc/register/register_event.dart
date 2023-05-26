part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailPasswordEvent extends RegisterEvent {
  final RequestFirebaseRegisterModel requestFirebaseRegisterModel;
  RegisterEmailPasswordEvent({required this.requestFirebaseRegisterModel});

  @override
  List<Object> get props => [requestFirebaseRegisterModel];
}
