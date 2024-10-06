import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/constants/constants.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_scaffold.dart';
import 'package:health_care_app/src/presentation/calendar/widget/app_bar_calendar.dart';
import 'package:health_care_app/src/presentation/calendar/widget/list_timeline_tracking.dart';
import 'package:health_care_app/src/presentation/calendar/widget/timeline_point_tracking_item.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

@RoutePage()
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      topPadding: 10,
      horizontalMargin: Constants.horizontalMargin,
      titleWidget: const AppBarCalendar(),
      body: Column(
        children: [
          const AppBarCalendar(),
          context.sizedBox(height: 40),
          _buildWeekPicker(),
          context.sizedBox(height: 10),
          const Expanded(child: ListTimelineTracking()),
        ],
      ),
    );
  }

  Widget _buildWeekPicker() {
    return WeeklyDatePicker(
      selectedDay: _selectedDay,
      changeDay: (value) => setState(() {
        _selectedDay = value;
      }),
      enableWeeknumberText: false,
      weeknumberColor: colorScheme(context).primary,
      weeknumberTextColor: colorScheme(context).outline,
      weekdayTextColor: colorScheme(context).outline,
      digitsColor: colorScheme(context).onPrimaryContainer,
      selectedDigitBackgroundColor: colorScheme(context).primary,
    );
  }
}
