import '../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponseDto {
  LoginResponseModel(
      {required String name,
      required String iBan,
      required String activationDate})
      : super(name: name, iBan: iBan, activationDate: activationDate);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        name: json['name'],
        iBan: json['iBan'],
        activationDate: json['activationDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iBan': iBan,
      'activationDate': activationDate,
    };
  }
}
