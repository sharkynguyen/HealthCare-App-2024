import 'dart:async';

import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/repository/user_repository.dart';
import 'package:health_care_app/src/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:health_care_app/src/domain/usecase/user/login_usecase.dart';
import 'package:health_care_app/src/domain/usecase/user/save_login_status_usecase.dart';

class UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    injector.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase(injector<UserRepository>()),
    );
    injector.registerSingleton<SaveLoginStatusUseCase>(
      SaveLoginStatusUseCase(injector<UserRepository>()),
    );
    injector.registerSingleton<LoginUseCase>(
      LoginUseCase(injector<UserRepository>()),
    );
  }
}
