import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/error/exceptions.dart';
import 'package:flutter_app/src/core/error/failures.dart';
import 'package:flutter_app/src/core/network/network_info.dart';
import 'package:flutter_app/src/core/util/constants.dart';
import 'package:flutter_app/src/features/login/data/data_sources/login_local_datasource.dart';
import 'package:flutter_app/src/features/login/data/data_sources/login_remote_datasource.dart';
import 'package:flutter_app/src/features/login/data/models/login_response_model.dart';
import 'package:flutter_app/src/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSourceImpl loginRemoteDataSourceImpl;
  final NetworkInfoImpl networkInfoImpl;
  final LoginLocalDataSourceImpl loginLocalDataSourceImpl;

  LoginRepositoryImpl(
      {@required this.loginLocalDataSourceImpl,
      @required this.networkInfoImpl,
      @required this.loginRemoteDataSourceImpl});

  @override
  Future<Either<Failure, LoginResponseModel>> makeLoginRequest(
      String userName, String userPassword) async {
    if (await networkInfoImpl.isConnected) {
      try {
        final loginResponse = await loginRemoteDataSourceImpl.makeLoginRequest(
            userName, userPassword);
        return Right(loginResponse);
      } on RemoteException catch (exception) {
        return Left(RemoteFailure(
            message: exception.dioError.message,
            errorType: exception.dioError.type));
      }
    } else {
      return Left(RemoteFailure(
          message: NO_INTERNET_MSG, errorType: DioErrorType.DEFAULT));
    }
  }
}
