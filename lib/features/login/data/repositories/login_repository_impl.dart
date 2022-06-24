import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_local_datasource.dart';
import '../data_sources/login_remote_datasource.dart';
import '../models/login_response_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSourceImpl;
  final NetworkInfo networkInfoImpl;
  final LoginLocalDataSource loginLocalDataSourceImpl;

  LoginRepositoryImpl(
      {required this.loginLocalDataSourceImpl,
      required this.networkInfoImpl,
      required this.loginRemoteDataSourceImpl});

  @override
  Future<Either<Exception, LoginResponseModel?>> makeLoginRequest(
      LoginRequest loginRequest) async {
    var loginResponse;
    if (await networkInfoImpl.isConnected) {
      try {
        loginResponse =
            await loginRemoteDataSourceImpl.makeLoginRequest(loginRequest);
        return Right(loginResponse);
      } on ServerException catch (exception) {
        return Left(ServerException(dioError: exception.dioError));
      }
    } else {
      return Left(NoInternetException(message: "no_internet_connection"));
    }
  }
}
