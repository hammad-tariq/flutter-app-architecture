import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/env_config.dart';
import '../../features/login/data/data_sources/login_local_datasource.dart';
import '../../features/login/data/data_sources/login_remote_datasource.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../db/app_database.dart';
import '../logger/firebase_logger.dart';
import '../network/network_client.dart';
import '../network/network_info.dart';
import '../network/pretty_dio_logger.dart';

final serviceLocator = GetIt.I;

Future<void> initDI() async {
  // TODO: SEPARATE REMOTE, CACHE, DOMAIN, DATA DEPENDENCIES

  Dio _dio = Dio();
  BaseOptions baseOptions = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 5000,
      headers: {"Content-Type": "application/json"},
      baseUrl: GlobalAppConfig.getInstance()?.apiBaseURL ?? "",
      maxRedirects: 2);
  _dio.options = baseOptions;

  (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  _dio.interceptors.clear();

  _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      error: true,
      request: true,
      compact: true,
      maxWidth: 90,
      requestHeader: true,
      responseBody: true,
      responseHeader: false));

  _dio.interceptors.add(InterceptorsWrapper(onError: (DioError error, handler) {
    return handler.next(error);
  }, onRequest: (RequestOptions requestOptions, handler) async {
    return handler.next(requestOptions);
  }, onResponse: (response, handler) async {
    return handler.next(response);
  }));

  serviceLocator.registerLazySingleton(() => _dio);

  // Firebase logger
  serviceLocator.registerLazySingleton(() => FirebaseLogger());

  // Database initialize.
  serviceLocator.registerSingleton(() => openConnection());

  // Network Client.
  serviceLocator
      .registerLazySingleton(() => NetworkClient(dio: serviceLocator()));

  // Local Cache/ Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // DATA SOURCES
  serviceLocator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(networkClient: serviceLocator()));

  serviceLocator.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  // REPOSITORIES
  serviceLocator.registerLazySingleton<LoginRepositoryImpl>(() =>
      LoginRepositoryImpl(
          networkInfoImpl: serviceLocator(),
          loginLocalDataSourceImpl: serviceLocator(),
          loginRemoteDataSourceImpl: serviceLocator()));

  // USE CASES

  // BLOC
  serviceLocator.registerFactory<LoginCubit>(
      () => LoginCubit(loginRepository: serviceLocator()));
  // DATA SOURCES

  // REPOSITORIES

  // USE CASES

  // BLOC
}
