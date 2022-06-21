import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<Either<Exception, LoginResponseModel?>> makeLoginRequest(
      LoginRequest loginRequest);
}

class LoginRequest extends Equatable {
  final String? email;
  final String? password;

  const LoginRequest({this.email, this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password];
}
