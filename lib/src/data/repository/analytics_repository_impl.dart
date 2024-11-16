import 'package:health_care_app/src/core/data/network/dio_client.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/entity/health_advice.dart';
import 'package:health_care_app/src/domain/repository/analytics_repository.dart';

import 'package:health_care_app/src/utils/https/app_rest_client.dart';

class AnalyticsRepositoryImpl extends AnalyticsRepository {
  AnalyticsRepositoryImpl(this.restClient);

  final RestClient restClient;

  @override
  Future<List<HealthAdvice>> getHealthAdvices() async {
    try {
      final response = await injector
          .get<DioClient>()
          .dio
          .get('https://smarthomecmn.vercel.app/feed/advices');

      if (response.statusCode == 200 && response.data != null) {
        final dataList = (response.data['data'] as List)
            .map((data) => HealthAdvice.fromJson(data))
            .toList();

        return dataList;
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
