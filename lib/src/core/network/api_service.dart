import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/network/network_client.dart';
import 'package:flutter_app/src/core/util/constants.dart';

class ApiService {
  final NetworkClient networkClient;

  ApiService({@required this.networkClient});

  Future<Response> loginApiRequest(Map<String, String> params) async {
    return await networkClient.get(LOGIN_API, params);
  }
}
