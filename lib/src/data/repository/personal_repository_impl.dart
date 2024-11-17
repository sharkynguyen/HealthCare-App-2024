import 'package:health_care_app/src/core/data/network/dio_client.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/entity/personal_info.dart';
import 'package:health_care_app/src/domain/repository/personal_repository.dart';
import 'package:health_care_app/src/utils/https/app_rest_client.dart';
import 'package:logger/logger.dart';

class PersonalRepositoryImpl extends PersonalRepository {
  PersonalRepositoryImpl(this.restClient);

  final RestClient restClient;

  @override
  Future<List<PersonalInfo>> getPersonInfo() async {
    try {
      final response = await injector
          .get<DioClient>()
          .dio
          .get('https://smarthomecmn.vercel.app/feed/personal');

      if (response.statusCode == 200 && response.data != null) {
        final dataList = (response.data['data'] as List)
            .map((data) => PersonalInfo.fromJson(data))
            .toList();

        return dataList;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> updatePersonInfo(PersonalInfo info) async {
    try {
      final response = await injector.get<DioClient>().dio.post(
        'https://smarthomecmn.vercel.app/feed/personal_info',
        data: {
          "age": info.age,
          "gender": info.gender,
          "heartDesease": info.heartDesease,
          "otherDease": info.otherDease,
          "heart": info.heart,
          "oxygen": info.oxygen,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        Logger().d('update personal info');
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
