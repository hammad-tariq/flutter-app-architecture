import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/listing/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserListLocalDataSource {
  // Get the cached [UserModel]
  // throws exception if no data found.
  Future<UserModel> getUsersList();

  Future<void> saveUsersList(UserModel userModel);
}

const CACHED_USER_LIST = 'CACHED_USER_LIST';

class UserListLocalDataSourceImpl implements UserListLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserListLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<UserModel> getUsersList() {
    final jsonString = sharedPreferences.get(CACHED_USER_LIST);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      // TODO: return exception.
      return null;
    }
  }

  @override
  Future<void> saveUsersList(UserModel userModel) {
    return sharedPreferences.setString(
        CACHED_USER_LIST, json.encode(userModel.toJson()));
  }
}
