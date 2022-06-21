import 'dart:io';
import 'package:dio/dio.dart';
import '../error/exception.dart';
import 'dart:async';

class NetworkClient {
  final Dio dio;

  NetworkClient({required this.dio});

  Future<Response> invoke(String url, RequestType requestType,
      {Map<String, String>? queryParameters,
      Map<String, String>? headers,
      dynamic requestBody}) async {
    Response response;
    try {
      switch (requestType) {
        case RequestType.get:
          response = await dio.get(url,
              queryParameters: queryParameters,
              options: Options(responseType: ResponseType.json));
          break;
        case RequestType.post:
          response = await dio.post(url,
              queryParameters: queryParameters,
              data: requestBody,
              options: Options(responseType: ResponseType.json));
          break;
        case RequestType.put:
          response = await dio.put(url,
              data: requestBody,
              options: Options(responseType: ResponseType.json));
          break;
        case RequestType.delete:
          response = await dio.delete(url,
              queryParameters: queryParameters,
              data: requestBody,
              options: Options(responseType: ResponseType.json));
          break;
        case RequestType.patch:
          response = await dio.patch(url,
              queryParameters: queryParameters,
              data: requestBody,
              options: Options(responseType: ResponseType.json));
          break;
      }
      return response;
    } on DioError catch (dioError) {
      throw ServerException(dioError: dioError);
    } on SocketException {
      rethrow;
    }
  }
}

// Types used by invoke API.
enum RequestType { get, post, put, delete, patch }
