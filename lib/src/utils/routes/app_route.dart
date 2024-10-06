import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(path: '/splash', page: Splash.page),
        AutoRoute(path: '/dashboard', initial: true, page: DashboardRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
        AutoRoute(path: '/calendar', page: CalendarRoute.page),
        AutoRoute(path: '/analytics', page: AnalyticsRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
      ];
}
