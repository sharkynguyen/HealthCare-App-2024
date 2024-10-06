import 'package:flutter/material.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/analytics/analytics_page.dart';
import 'package:health_care_app/src/presentation/calendar/calendar_page.dart';
import 'package:health_care_app/src/presentation/dashboard/store/dashboard_store.dart';
import 'package:health_care_app/src/presentation/home/home_page.dart';
import 'package:mobx/mobx.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody>
    with AutomaticKeepAliveClientMixin {
  final DashboardStore _dashboardStore = injector<DashboardStore>();
  final PageController _pageController = PageController();
  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    _disposer = reaction<int>(
      (_) => _dashboardStore.selectedTabIndex,
      (index) => _pageTransition(index),
    );
  }

  void _pageTransition(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        CalendarPage(),
        AnalyticsPage(),
        Text('Setting'),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _disposer();
    _pageController.dispose();
    super.dispose();
  }
}
