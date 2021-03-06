import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/error/exceptions.dart';
import 'package:flutter_app/src/core/network/api_service.dart';
import 'package:flutter_app/src/features/login/data/models/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> makeLoginRequest(
      String userName, String userPassword);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<LoginResponseModel> makeLoginRequest(
      String userName, String userPassword) async {
    Map<String, String> params;
    LoginResponseModel loginResponseModel;
    Response response = await apiService.loginApiRequest(params);
    try {
      loginResponseModel = LoginResponseModel.fromJson(response.data);
      return loginResponseModel;
    } on RemoteException catch (exception) {
      throw exception;
    }
  }
}
