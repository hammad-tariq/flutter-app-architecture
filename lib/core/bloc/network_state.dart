import 'package:equatable/equatable.dart';

abstract class NetworkState extends Equatable {}

class NetworkConnectedState extends NetworkState {
  @override
  List<Object?> get props => [];
}

class NetworkInitialState extends NetworkState {
  @override
  List<Object?> get props => [];
}

class NetworkDisConnectedState extends NetworkState {
  @override
  List<Object?> get props => [];
}
