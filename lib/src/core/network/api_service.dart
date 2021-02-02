import 'package:dio/dio.dart';
import 'package:flutter_app/src/core/network/network_client.dart';
import 'package:flutter_app/src/core/util/constants.dart';

class ApiService {
  NetworkClient _networkClient;

  ApiService() {
    _networkClient = NetworkClient();
  }

  Future<Response> loginApiRequest(Map<String, String> params) async {
    return await _networkClient.get(LOGIN_API, params);
  }
}
