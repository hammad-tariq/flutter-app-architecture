import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_response_model.dart';

abstract class LoginLocalDataSource {
  Future<LoginResponseModel?> getUserProfile();

  Future<void> saveUserProfile();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LoginResponseModel?> getUserProfile() async {
    // TODO: implement getUserProfile
    return null;
  }

  @override
  Future<void> saveUserProfile() async {
    // TODO: implement saveUserProfile
    return null;
  }
}
