import 'dart:async';

import 'package:health_care_app/src/core/stores/error_store.dart';
import 'package:health_care_app/src/core/stores/form_store.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/repository/setting_repository.dart';
import 'package:health_care_app/src/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:health_care_app/src/domain/usecase/user/login_usecase.dart';
import 'package:health_care_app/src/domain/usecase/user/save_login_status_usecase.dart';
import 'package:health_care_app/src/presentation/dashboard/store/dashboard_store.dart';
import 'package:health_care_app/src/presentation/home/store/language_store.dart';
import 'package:health_care_app/src/presentation/home/store/theme_store.dart';
import 'package:health_care_app/src/presentation/login/store/login_store.dart';
import 'package:health_care_app/src/utils/routes/app_route.dart';

class StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // factories:---------------------------------------------------------------
    injector.registerFactory(() => ErrorStore());
    injector.registerFactory(() => FormErrorStore());
    injector.registerFactory(
      () => FormStore(injector<FormErrorStore>(), injector<ErrorStore>()),
    );

    // stores:------------------------------------------------------------------
    injector.registerSingleton<UserStore>(
      UserStore(
        injector<IsLoggedInUseCase>(),
        injector<SaveLoginStatusUseCase>(),
        injector<LoginUseCase>(),
        injector<FormErrorStore>(),
        injector<ErrorStore>(),
      ),
    );

    injector.registerSingleton<AppRouter>(AppRouter());

    // injector.registerSingleton<PostStore>(
    //   PostStore(
    //     injector<GetPostUseCase>(),
    //     injector<ErrorStore>(),
    //   ),
    // );

    injector.registerSingleton<ThemeStore>(
      ThemeStore(
        injector<SettingRepository>(),
        injector<ErrorStore>(),
      ),
    );

    injector.registerSingleton<DashboardStore>(DashboardStore());

    injector.registerSingleton<LanguageStore>(
      LanguageStore(
        injector<SettingRepository>(),
        injector<ErrorStore>(),
      ),
    );
  }
}
