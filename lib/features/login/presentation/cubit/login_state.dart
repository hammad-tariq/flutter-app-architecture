part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginFailureState extends LoginState {
  final String message;

  const LoginFailureState({required this.message});
}

class LoginSuccessfulState extends LoginState {}

class LoginInProgressState extends LoginState {}
