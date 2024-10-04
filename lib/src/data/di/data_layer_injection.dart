class DataLayerInjection {
  static Future<void> configureDataLayerInjection() async {
    // await LocalModule.configureLocalModuleInjection();
    await NetworkModule.configureNetworkModuleInjection();
    // await RepositoryModule.configureRepositoryModuleInjection();
  }
}
