import 'package:event_bus/event_bus.dart';
import 'package:health_care_app/src/core/data/network/dio_client.dart';
import 'package:health_care_app/src/core/data/network/interceptor/auth_interceptor.dart';
import 'package:health_care_app/src/data/network/interceptor/error_interceptor.dart';
import 'package:health_care_app/src/di/di.dart';

class NetworkModule {
  static Future<void> configureNetworkModuleInjection() async {
    // event bus:---------------------------------------------------------------
    injector.registerSingleton<EventBus>(EventBus());

    // interceptors:------------------------------------------------------------
    // getIt.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
    injector.registerSingleton<ErrorInterceptor>(ErrorInterceptor(injector()));
    injector.registerSingleton<AuthInterceptor>(
      AuthInterceptor(
        accessToken: () async =>
            await injector<SharedPreferenceHelper>().authToken,
      ),
    );

    // rest client:-------------------------------------------------------------
    injector.registerSingleton(RestClient());

    // dio:---------------------------------------------------------------------
    getIt.registerSingleton<DioConfigs>(
      const DioConfigs(
        baseUrl: Endpoints.baseUrl,
        connectionTimeout: Endpoints.connectionTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
      ),
    );
    injector.registerSingleton<DioClient>(
      DioClient(dioConfigs: injector())
        ..addInterceptors(
          [
            getIt<AuthInterceptor>(),
            getIt<ErrorInterceptor>(),
            getIt<LoggingInterceptor>(),
          ],
        ),
    );

    // api's:-------------------------------------------------------------------
    getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));
  }
}
