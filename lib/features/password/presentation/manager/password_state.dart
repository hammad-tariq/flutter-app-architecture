part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();
}

class PasswordInitial extends PasswordState {
  @override
  List<Object> get props => [];
}
