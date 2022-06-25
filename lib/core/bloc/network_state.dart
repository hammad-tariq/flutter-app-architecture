import 'package:equatable/equatable.dart';

abstract class NetworkState extends Equatable {
  String get message;
}

class NetworkConnectedState extends NetworkState {
  @override
  List<Object?> get props => [];

  @override
  String get message => "Internet connected";
}

class NetworkInitialState extends NetworkState {
  @override
  List<Object?> get props => [];

  @override
  String get message => "Checking internet connection";
}

class NetworkDisConnectedState extends NetworkState {
  @override
  List<Object?> get props => [];

  @override
  String get message => "Inernet is not connected";
}
