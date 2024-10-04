// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:health_care_app/src/presentation/auth_gate/auth_gate_page.dart'
    as _i1;
import 'package:health_care_app/src/presentation/home/home_page.dart' as _i2;
import 'package:health_care_app/src/presentation/login/login_page.dart' as _i3;

/// generated route for
/// [_i1.AuthGatePage]
class AuthGateRoute extends _i4.PageRouteInfo<void> {
  const AuthGateRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthGateRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthGateRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthGatePage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}
