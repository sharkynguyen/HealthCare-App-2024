import 'package:health_care_app/src/presentation/di/module/store_module.dart';

class PresentationLayerInjection {
  static Future<void> configurePresentationLayerInjection() async {
    await StoreModule.configureStoreModuleInjection();
  }
}
