import 'dart:async';

import 'package:health_care_app/src/domain/entity/use.dart';
import 'package:health_care_app/src/domain/usecase/user/login_usecase.dart';

abstract class UserRepository {
  Future<User?> login(LoginParams params);

  Future<void> saveIsLoggedIn(bool value);

  Future<bool> get isLoggedIn;
}
