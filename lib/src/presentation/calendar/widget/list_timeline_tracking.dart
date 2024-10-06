import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/presentation/calendar/widget/timeline_point_tracking_item.dart';

class ListTimelineTracking extends StatelessWidget {
  const ListTimelineTracking({super.key});

  @override
  Widget build(BuildContext context) {
    final listColor = [
      colorScheme(context).primary,
      colorScheme(context).tertiary,
      colorScheme(context).error,
      colorScheme(context).secondary,
      colorScheme(context).primary,
      colorScheme(context).tertiary,
      colorScheme(context).error,
      colorScheme(context).secondary,
      colorScheme(context).primary,
      colorScheme(context).tertiary,
    ];

    final listTime = [
      '1:00',
      '2:00',
      '3:00',
      '4:00',
      '5:00',
      '6:00',
      '7:00',
      '8:00',
      '9:00',
      '10:00',
    ];

    return ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return TimelinePointTrackingItem(
            statusColor: listColor[index],
            time: listTime[index],
          );
        });
  }
}
