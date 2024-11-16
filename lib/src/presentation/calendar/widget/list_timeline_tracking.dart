import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/calendar/store/calendar_store.dart';
import 'package:health_care_app/src/presentation/calendar/widget/timeline_point_tracking_item.dart';

class ListTimelineTracking extends StatefulWidget {
  const ListTimelineTracking({super.key});

  @override
  State<ListTimelineTracking> createState() => _ListTimelineTrackingState();
}

class _ListTimelineTrackingState extends State<ListTimelineTracking> {
  final _calendarStore = injector.get<CalendarStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ListView.builder(
          itemCount: _calendarStore.sensorData.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return TimelinePointTrackingItem(
              time: _calendarStore.sensorData[index].updatedTime!,
              heartRate: _calendarStore.sensorData[index].heart.toString(),
              oxygen: _calendarStore.sensorData[index].oxygen.toString(),
            );
          }),
    );
  }
}
