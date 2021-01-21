import 'package:dartz/dartz.dart';
import 'package:flutter_app/src/core/error/failures.dart';
import 'package:flutter_app/src/core/usecases/usecase.dart';
import 'package:flutter_app/src/features/listing/domain/entities/user.dart';

class GetUserList implements UseCase<User, NoParams> {
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    // TODO: implement call
    return null;
  }
}
