import 'package:auto_route/auto_route.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/dashboard/store/dashboard_store.dart';
import 'package:health_care_app/src/presentation/dashboard/widgets/dashboard_body.dart';
import 'package:health_care_app/src/presentation/dashboard/widgets/navigation_item.dart';
import 'package:tuple/tuple.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardStore _dashboardStore = injector<DashboardStore>();

  int currentPageIndex = 0;

  void _onTabSelected(int index) {
    setState(() => currentPageIndex = index);
    _dashboardStore.selectedTabIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MyScaffold(
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) => _onTabSelected(index),
            indicatorColor: colorScheme(context).primary,
            selectedIndex: currentPageIndex,
            destinations: [
              Tuple3(
                IconsaxOutline.home,
                IconsaxBold.home,
                appLocal(context).home,
              ),
              Tuple3(
                IconsaxOutline.calendar,
                IconsaxBold.calendar,
                appLocal(context).calendar,
              ),
              Tuple3(
                IconsaxOutline.chart,
                IconsaxBold.chart_2,
                appLocal(context).analytics,
              ),
              Tuple3(
                IconsaxOutline.setting,
                IconsaxBold.setting,
                appLocal(context).setting,
              ),
            ]
                .map((e) => MyNavigationItem(
                      iconData: e.item1,
                      selectedIconData: e.item2,
                      label: e.item3,
                    ))
                .toList()),
        body: const DashboardBody(),
      ),
    );
  }
}
