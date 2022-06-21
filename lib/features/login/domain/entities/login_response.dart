import 'package:equatable/equatable.dart';

class LoginResponseDto extends Equatable {
  final String name;
  final String iBan;
  final String activationDate;

  LoginResponseDto(
      {required this.name, required this.iBan, required this.activationDate});

  @override
  List<Object> get props => [name, iBan, activationDate];
}
