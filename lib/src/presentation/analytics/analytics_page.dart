import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/widgets/my_rounded_button.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';
import 'package:health_care_app/src/presentation/analytics/widget/anaylitics_line_chart.dart';
import 'package:health_care_app/src/presentation/analytics/widget/app_bar_analytics.dart';
import 'package:health_care_app/src/presentation/analytics/widget/list_advice.dart';
import 'package:health_care_app/src/presentation/calendar/widget/app_bar_calendar.dart';

@RoutePage()
class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      topPadding: 10,
      horizontalMargin: Constants.horizontalMargin,
      titleWidget: const AppBarCalendar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarAnalytics(),
            context.sizedBox(height: 40),
            const SizedBox(
              height: 200,
              child: AnalyticsLineChart(
                isShowingMainData: true,
              ),
            ),
            context.sizedBox(height: 20),
            _buildTitleAdvices(context, 'Advices'),
            const ListAdvice(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAdvices(BuildContext context, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText.labelMedium(
          context,
          title,
          isBold: true,
        ),
        const Spacer(),
        RoundedButton.textAndDownArrow(context, 'All'),
      ],
    );
  }
}
