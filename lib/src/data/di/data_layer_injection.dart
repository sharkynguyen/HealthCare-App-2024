import 'package:health_care_app/src/data/di/modules/local_module.dart';
import 'package:health_care_app/src/data/di/modules/network_module.dart';
import 'package:health_care_app/src/data/di/modules/repository_module.dart';

class DataLayerInjection {
  static Future<void> configureDataLayerInjection() async {
    await LocalModule.configureLocalModuleInjection();
    await NetworkModule.configureNetworkModuleInjection();
    await RepositoryModule.configureRepositoryModuleInjection();
  }
}
