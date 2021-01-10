import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// Represent failures from Server/Remote data source.
class RemoteFailure implements Exception {}

// Represent failures from Cache.
class LocalFailure implements Exception {}
