import 'package:health_care_app/src/core/data/network/dio_client.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/entity/calendar_sensor.dart';
import 'package:health_care_app/src/domain/repository/calendar_repository.dart';
import 'package:health_care_app/src/utils/https/app_rest_client.dart';

class CalendarRepositoryImpl extends CalendarRepository {
  CalendarRepositoryImpl(this.restClient);

  final RestClient restClient;

  @override
  Future<List<CalendarSensor>> getListSensorData() async {
    try {
      final response = await injector
          .get<DioClient>()
          .dio
          .get('https://smarthomecmn.vercel.app/feed/heart_oxygen');

      if (response.statusCode == 200 && response.data != null) {
        final dataList = (response.data['data'] as List)
            .map((data) => CalendarSensor.fromJson(data))
            .toList();

        return dataList;
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
