import 'package:dartz/dartz.dart';
import 'package:flutter_app/src/core/error/failures.dart';
import 'package:flutter_app/src/features/login/domain/entities/login_response.dart';
import 'package:flutter_app/src/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, LoginResponseDto>> makeLoginRequest(
      String userName, String userPassword) async {
    // TODO: implement makeLoginRequest
    return null;
  }
}
