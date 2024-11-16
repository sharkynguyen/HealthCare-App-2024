import 'dart:async';

import 'package:health_care_app/src/domain/entity/calendar_sensor.dart';

abstract class CalendarRepository {
  Future<List<CalendarSensor>> getListSensorData();
}
