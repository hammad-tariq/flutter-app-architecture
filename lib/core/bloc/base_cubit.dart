import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../error/exception.dart';
import 'package:bloc/bloc.dart';

abstract class BaseCubit<State> extends BlocBase<State> {
  /// {@macro cubit}
  BaseCubit(State initialState) : super(initialState);

  String handleException(Exception exception) {
    var message = "";
    if (exception is ServerException) {
      return handleDioError(exception.dioError);
    } else if (exception is NoInternetException) {
      message = "No internet connection available";
    } else {
      message = "An Exception has occurred";
    }

    log("Cubit response.fold left: " + message);
    return message;
  }

  handleDioError(DioError dioError) {
    String message = "";
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout";
        break;
      case DioErrorType.other:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        {
          if (dioError.response?.statusCode == 204) {
          } else if (dioError.response?.statusCode == 400) {
            // BadRequestException
            message = "BadRequestException";
          } else if (dioError.response?.statusCode == 401) {
            // UnauthorisedException
            message = "UnauthorisedException";
          } else if (dioError.response?.statusCode == 403) {
            // ForbiddenException
            message = "ForbiddenException";
          } else if (dioError.response?.statusCode == 500) {
            // ServerException
            message = "ServerException";
          } else {
            message =
                "Received invalid status code: ${dioError.response?.statusCode}";
          }
        }
        break;
      case DioErrorType.sendTimeout:
        message = "Receive timeout in send request";
        break;
    }
    return message;
  }
}
