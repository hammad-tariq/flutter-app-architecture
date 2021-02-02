import 'package:flutter_app/src/features/login/data/data_sources/login_local_datasource.dart';
import 'package:flutter_app/src/features/login/data/data_sources/login_remote_datasource.dart';
import 'package:flutter_app/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_app/src/features/login/domain/use_cases/login_usecase.dart';
import 'package:flutter_app/src/features/login/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.asNewInstance();

Future<void> initDI() async {
  // Bloc
  serviceLocator.registerFactory(() => LoginBloc());

  // Use Cases

  // Repository

  // Data Sources

  // Api Service

  // Network Client

  // Local Cache/ Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
}
