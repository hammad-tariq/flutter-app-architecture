import 'package:dartz/dartz.dart';
import 'package:flutter_app/src/core/error/failures.dart';
import 'package:flutter_app/src/features/login/domain/entities/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseDto>> makeLoginRequest(
      String userName, String userPassword);
}
