import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/login/domain/use_cases/login_usecase.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRequestUserCase loginRequestUserCase;

  LoginBloc({@required this.loginRequestUserCase}) : super(Empty());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginRequestEvent) {
      var result = await loginRequestUserCase.makeLoginRequest(
          event.userName, event.password);
      yield* result.fold((l) async* {
        yield LoginFailed(message: '');
      }, (r) async* {
        yield LoginSuccessful();
      });
    }
  }
}
