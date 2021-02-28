import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super();
}

class Empty extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginInProgress extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginSuccessful extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed({@required this.message}) : super();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}