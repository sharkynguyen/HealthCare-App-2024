import 'dart:async';

import 'package:health_care_app/src/data/datasource/post_datasource.dart';
import 'package:health_care_app/src/data/share_prefrence/share_prefence_helper.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    // preference manager:------------------------------------------------------
    injector.registerSingletonAsync<SharedPreferences>(
        SharedPreferences.getInstance);
    injector.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(await injector.getAsync<SharedPreferences>()),
    );

    // database:----------------------------------------------------------------

    // injector.registerSingletonAsync<SembastClient>(
    //   () async => SembastClient.provideDatabase(
    //     databaseName: DBConstants.DB_NAME,
    //     databasePath: kIsWeb
    //         ? "/assets/db"
    //         : (await getApplicationDocumentsDirectory()).path,
    //   ),
    // );

    // data sources:------------------------------------------------------------
    injector.registerSingleton(PostDataSource());
  }
}
