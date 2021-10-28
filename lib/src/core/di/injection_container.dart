import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/src/core/network/api_service.dart';
import 'package:flutter_app/src/core/network/network_client.dart';
import 'package:flutter_app/src/core/network/network_info.dart';
import 'package:flutter_app/src/core/util/theme_controller.dart';
import 'package:flutter_app/src/features/login/data/data_sources/login_local_datasource.dart';
import 'package:flutter_app/src/features/login/data/data_sources/login_remote_datasource.dart';
import 'package:flutter_app/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_app/src/features/login/domain/use_cases/login_usecase.dart';
import 'package:flutter_app/src/features/login/presentation/bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.I;

Future<void> initDI() async {
  print("init DI is called.");

  Dio _dio = Dio();

  BaseOptions baseOptions = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 5000,
      headers: {"Content-Type": "application/json"},
      baseUrl: "http://google.com",
      maxRedirects: 2);
  _dio.options = baseOptions;

  (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  _dio.interceptors.clear();

  _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true));

  _dio.interceptors.add(InterceptorsWrapper(onError: (DioError error, handler) {
    return handler.next(error);
  }, onRequest: (RequestOptions requestOptions, handler) async {
    return handler.next(requestOptions);
  }, onResponse: (response, handler) async {
    return handler.next(response);
  }));

  serviceLocator.registerLazySingleton(() => _dio);

  // Api Service
  serviceLocator.registerLazySingleton<ApiService>(
      () => ApiService(networkClient: serviceLocator()));

  // Network Client
  serviceLocator.registerLazySingleton<NetworkClient>(() => NetworkClient(
      sharedPreferences: serviceLocator(), dio: serviceLocator()));

  // Local Cache/ Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  serviceLocator.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());

  // Core
  serviceLocator.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(serviceLocator()));

  // ThemeController
  ThemeController themeController = Get.put(ThemeController());
  serviceLocator.registerLazySingleton<ThemeController>(() => themeController);

  // Data Sources
  serviceLocator.registerLazySingleton<LoginRemoteDataSourceImpl>(
      () => LoginRemoteDataSourceImpl(apiService: serviceLocator()));
  serviceLocator.registerLazySingleton<LoginLocalDataSourceImpl>(
      () => LoginLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<LoginRepositoryImpl>(() =>
      LoginRepositoryImpl(
          networkInfoImpl: serviceLocator(),
          loginLocalDataSourceImpl: serviceLocator(),
          loginRemoteDataSourceImpl: serviceLocator()));

  // Use Cases
  serviceLocator.registerLazySingleton<LoginRequestUserCase>(
      () => LoginRequestUserCase(serviceLocator()));

  // Bloc
  serviceLocator.registerFactory<LoginBloc>(
      () => LoginBloc(loginRequestUserCase: serviceLocator()));
}
