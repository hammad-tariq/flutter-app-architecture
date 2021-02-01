import 'package:dio/dio.dart';
import 'package:flutter_app/src/core/util/constants.dart';

class NetworkClient {
  Dio _dio;

  NetworkClient() {
    BaseOptions baseOptions = BaseOptions(
        receiveTimeout: 3500,
        connectTimeout: 3500,
        baseUrl: API_BASE_URL,
        maxRedirects: 2);
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor());
  }

  // for HTTP.GET Request.
  Future<Response> get(String url, Map<String, String> params) async {
    Response response = await _dio.get(url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json));
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> post(String url, Map<String, String> params) async {
    Response response = await _dio.post(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}
