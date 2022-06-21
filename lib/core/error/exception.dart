import 'package:dio/dio.dart';

enum ErrorType {
  nointernet,
  badrequest,
  unauthorised,
  forbidden,
  success,
  other
}

class ServerException implements Exception {
  late DioError dioError;
  late String? message;
  late ErrorType? errorType;

  ServerException({required this.dioError, this.message, this.errorType});

  ServerException.withException({required DioError dioError}) {}
}

class NoInternetException implements Exception {
  final String message;

  NoInternetException({required this.message});
}

class CacheException implements Exception {}
