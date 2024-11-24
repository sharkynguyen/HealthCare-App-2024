import 'package:health_care_app/src/core/data/network/dio_client.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/repository/advice_repository.dart';
import 'package:logger/logger.dart';

class AdviceRepositoryImpl extends AdviceRepository {
  @override
  Future<void> updateLastestAdvice({
    required String msg,
    required double heart,
    required double oxygen,
    required String updatedTime,
  }) async {
    try {
      final response = await injector.get<DioClient>().dio.post(
        'https://smarthomecmn.vercel.app/feed/lastest_advice',
        data: {
          "msg": msg,
          "heart": heart,
          "oxygen": oxygen,
          "updated_time": updatedTime,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        Logger().d('Successfully updated latest advice');
      } else {
        Logger().w(
            'Request completed but response is not as expected: ${response.statusCode}');
      }
    } catch (e) {
      Logger().e('Error updating latest advice$e');
    }
  }
}
