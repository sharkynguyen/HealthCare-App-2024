import 'dart:async';

import 'package:health_care_app/src/domain/entity/personal_info.dart';

abstract class PersonalRepository {
  Future<List<PersonalInfo>> getPersonInfo();

  Future<void> updatePersonInfo(PersonalInfo info);
}
