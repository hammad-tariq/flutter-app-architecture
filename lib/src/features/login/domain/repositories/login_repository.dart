import 'package:dartz/dartz.dart';
import 'package:flutter_app/src/core/error/failures.dart';
import 'package:flutter_app/src/features/login/data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseModel>> makeLoginRequest(
      String userName, String userPassword);
}
