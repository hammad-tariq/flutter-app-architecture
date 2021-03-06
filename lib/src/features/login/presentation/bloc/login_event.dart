import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginRequestEvent implements LoginEvent {
  final String userName;
  final String password;
  final bool rememberMe;

  LoginRequestEvent(
      {@required this.userName,
      @required this.password,
      @required this.rememberMe});

  @override
  List<Object> get props => [userName, password, rememberMe];

  @override
  bool get stringify => true;
}
