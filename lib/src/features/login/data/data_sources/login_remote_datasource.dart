import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/login/data/models/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> makeLoginRequest(
      String userName, String userPassword);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio httpClient;

  LoginRemoteDataSourceImpl({@required this.httpClient});

  @override
  Future<LoginResponseModel> makeLoginRequest(
      String userName, String userPassword) async {
    return null;
  }
}
