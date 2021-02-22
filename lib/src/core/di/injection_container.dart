import 'package:flutter_app/src/core/network/api_service.dart';
import 'package:flutter_app/src/core/network/network_client.dart';
import 'package:flutter_app/src/core/network/network_info.dart';
import 'package:flutter_app/src/features/login/data/data_sources/login_local_datasource.dart';
import 'package:flutter_app/src/features/login/data/data_sources/login_remote_datasource.dart';
import 'package:flutter_app/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_app/src/features/login/domain/use_cases/login_usecase.dart';
import 'package:flutter_app/src/features/login/presentation/bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.I;

Future<void> initDI() async {
  print("init DI is called.");

  // Api Service
  serviceLocator.registerLazySingleton<ApiService>(
      () => ApiService(networkClient: serviceLocator()));

  // Network Client
  serviceLocator.registerLazySingleton<NetworkClient>(() => NetworkClient());

  // Local Cache/ Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  serviceLocator.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  // Core
  serviceLocator.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(serviceLocator()));

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
