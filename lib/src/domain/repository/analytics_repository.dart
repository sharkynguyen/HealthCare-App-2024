import 'dart:async';

import 'package:health_care_app/src/domain/entity/health_advice.dart';

abstract class AnalyticsRepository {
  Future<List<HealthAdvice>> getHealthAdvices();
}
