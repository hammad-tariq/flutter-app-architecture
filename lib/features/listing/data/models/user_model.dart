import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required int id,
      required String email,
      required String firstName,
      required String lastName,
      required String avatar})
      : super(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            avatar: avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['lastName'],
        lastName: json['lastName'],
        avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar
    };
  }
}
