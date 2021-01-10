import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  // TODO: implement initialState
  LoginState get initialState => null;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement
  }
}
