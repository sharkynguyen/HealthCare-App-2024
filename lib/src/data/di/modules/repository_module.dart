import 'dart:async';

import 'package:health_care_app/src/data/datasource/post_datasource.dart';
import 'package:health_care_app/src/data/repository/post_repository.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/domain/repository/post_repository.dart';

class RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------

    injector.registerSingleton<PostRepository>(
        PostRepositoryImpl(injector<PostDataSource>()));
  }
}
