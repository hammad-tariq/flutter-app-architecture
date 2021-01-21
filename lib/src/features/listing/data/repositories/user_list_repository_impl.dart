import 'package:dartz/dartz.dart';
import 'package:flutter_app/src/core/error/failures.dart';
import 'package:flutter_app/src/features/listing/domain/entities/user.dart';
import 'package:flutter_app/src/features/listing/domain/repositories/user_list_repository.dart';

class UserListRepositoryImpl extends UserListRepository {
  UserListRepositoryImpl();

  @override
  Future<Either<Failure, User>> getUserList() {
    // TODO: implement getUserList
    return null;
  }
}
