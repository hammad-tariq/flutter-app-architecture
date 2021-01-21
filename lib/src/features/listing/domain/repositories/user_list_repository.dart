import 'package:dartz/dartz.dart';
import 'package:flutter_app/src/core/error/failures.dart';
import 'package:flutter_app/src/features/listing/domain/entities/user.dart';

abstract class UserListRepository {
  Future<Either<Failure, User>> getUserList();
}
