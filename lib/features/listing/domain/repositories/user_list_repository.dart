import 'package:dartz/dartz.dart';
import '../entities/user.dart';

abstract class UserListRepository {
  Future<Either<Exception, User>>? getUserList();
}
