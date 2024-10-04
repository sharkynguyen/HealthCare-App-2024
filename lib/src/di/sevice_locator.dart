import 'package:health_care_app/src/data/di/data_layer_injection.dart';

class ServiceLocator {
  static Future<void> configureDependencies() async {
    await DataLayerInjection.configureDataLayerInjection();
    // await DomainLayerInjection.configureDomainLayerInjection();
    // await PresentationLayerInjection.configurePresentationLayerInjection();
  }
}
