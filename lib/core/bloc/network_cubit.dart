import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit(NetworkState initialState) : super(initialState);

  void networkConnected() {
    emit(NetworkConnectedState());
  }

  void networkDisconneced() {
    emit(NetworkDisConnectedState());
  }

  // @override
  // Future<Function> close() {
  //
  // }
}
