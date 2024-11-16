import 'package:dio/dio.dart';
import 'package:health_care_app/src/domain/entity/calendar_sensor.dart';
import 'package:retrofit/retrofit.dart';

part 'app_rest_client.g.dart';

@RestApi(baseUrl: 'https://smarthomecmn.vercel.app/feed/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/heart_oxygen')
  Future<List<CalendarSensor>> getSensorData();
}
