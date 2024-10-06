import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/l10n/app_localizations.dart';
import 'package:health_care_app/src/utils/routes/app_route.dart';

class MyApp extends StatelessWidget {
  // final ThemeStore _themeStore = getIt<ThemeStore>();
  // final LanguageStore _languageStore = getIt<LanguageStore>();
  // final UserStore _userStore = getIt<UserSt  ore>();

  final AppRouter _appRouter = injector<AppRouter>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          title: Constants.appName,
          // theme: _themeStore.darkMode
          //     ? AppThemeData.darkThemeData
          //     : AppThemeData.lightThemeData,
          // routes: Routes.routes,
          // locale: Locale(_languageStore.locale),
          // supportedLocales: _languageStore.supportedLanguages
          //     .map((language) => Locale(language.locale, language.code))
          //     .toList(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // home: _userStore.isLoggedIn ? HomeScreen() : LoginScreen(),
        );
      },
    );
  }
}
