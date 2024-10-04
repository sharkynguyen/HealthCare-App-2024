import 'dart:async';

import 'package:health_care_app/src/data/share_prefrence/share_prefence_helper.dart';
import 'package:health_care_app/src/domain/entity/use.dart';
import 'package:health_care_app/src/domain/repository/user_repository.dart';
import 'package:health_care_app/src/domain/usecase/user/login_usecase.dart';

class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  UserRepositoryImpl(this._sharedPrefsHelper);

  // Login:---------------------------------------------------------------------
  @override
  Future<User?> login(LoginParams params) async {
    return await Future.delayed(const Duration(seconds: 2), () => User());
  }

  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
}
