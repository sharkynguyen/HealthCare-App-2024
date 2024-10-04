import 'package:health_care_app/src/di/modules/network_module.dart';

class DataLayerInjection {
  static Future<void> configureDataLayerInjection() async {
    // await LocalModule.configureLocalModuleInjection();
    await NetworkModule.configureNetworkModuleInjection();
    // await RepositoryModule.configureRepositoryModuleInjection();
  }
}
