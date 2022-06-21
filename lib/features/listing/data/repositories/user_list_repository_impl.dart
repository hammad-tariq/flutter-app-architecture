import 'package:dartz/dartz.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_list_repository.dart';

class UserListRepositoryImpl extends UserListRepository {
  UserListRepositoryImpl();

  @override
  Future<Either<Exception, User>>? getUserList() {
    // TODO: implement getUserList
    return null;
  }
}
