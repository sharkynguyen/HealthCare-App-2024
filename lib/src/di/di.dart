import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care_app/src/l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

GetIt get injector => GetIt.instance;

AppLocalizations appLocal(BuildContext context) =>
    AppLocalizations.of(context)!;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureCoreDependencies() {
  return $initGetIt(injector);
}

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  // RestClient get restClient => MyHttp.rl();
}
