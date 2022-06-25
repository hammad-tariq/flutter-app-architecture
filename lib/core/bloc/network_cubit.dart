import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription? subscription;
  SimpleConnectionChecker simpleConnectionChecker = SimpleConnectionChecker();

  NetworkCubit() : super(NetworkInitialState()) {
    subscription =
        simpleConnectionChecker.onConnectionChange.listen((connected) {
      log("Network onConnectionChange: $connected");
      connected
          ? emit(NetworkConnectedState())
          : emit(NetworkDisConnectedState());
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
