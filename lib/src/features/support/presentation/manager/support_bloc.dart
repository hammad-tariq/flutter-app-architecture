import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportInitial()) {
    on<SupportEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
