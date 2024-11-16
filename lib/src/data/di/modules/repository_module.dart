import 'dart:async';

import 'package:health_care_app/src/data/repository/adafruit_respository_impl.dart';
import 'package:health_care_app/src/data/repository/analytics_repository_impl.dart';
import 'package:health_care_app/src/data/repository/calendar_repository_impl.dart';
import 'package:health_care_app/src/data/repository/setting_repository.dart';
import 'package:health_care_app/src/data/repository/user_repository.dart';
import 'package:health_care_app/src/data/share_prefrence/share_prefence_helper.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/repository/adafruit_repository.dart';
import 'package:health_care_app/src/domain/repository/analytics_repository.dart';
import 'package:health_care_app/src/domain/repository/calendar_repository.dart';

import 'package:health_care_app/src/domain/repository/setting_repository.dart';
import 'package:health_care_app/src/domain/repository/user_repository.dart';
import 'package:health_care_app/src/utils/https/app_rest_client.dart';

class RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------

    injector.registerSingleton<SettingRepository>(SettingRepositoryImpl(
      injector<SharedPreferenceHelper>(),
    ));

    injector.registerSingleton<UserRepository>(UserRepositoryImpl(
      injector<SharedPreferenceHelper>(),
    ));

    injector.registerSingleton<AdafruitRepository>(AdafruitRepositoryImpl());

    injector.registerSingleton<CalendarRepository>(
        CalendarRepositoryImpl(injector.get<RestClient>()));

    injector.registerSingleton<AnalyticsRepository>(
        AnalyticsRepositoryImpl(injector.get<RestClient>()));
  }
}
