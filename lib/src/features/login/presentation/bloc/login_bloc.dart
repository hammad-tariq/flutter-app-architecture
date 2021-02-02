import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/login/domain/use_cases/login_usecase.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  final LoginRequestUserCase loginRequestUserCase;

  LoginBloc({@required this.loginRequestUserCase});

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginRequestEvent) {
      await loginRequestUserCase.makeLoginRequest(
          event.userName, event.password);
    }
  }
}
