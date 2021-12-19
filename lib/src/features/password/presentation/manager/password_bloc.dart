import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitial()) {
    on<PasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
