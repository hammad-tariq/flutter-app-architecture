import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(message) : super(message);
}

enum LocationFailureReason { denied, disabled, unknown }

class LocationFailure extends Failure {
  const LocationFailure(message, LocationFailureReason)
      : super(
          message,
        );
}
