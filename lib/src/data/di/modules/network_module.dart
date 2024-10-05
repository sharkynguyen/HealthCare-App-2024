import 'package:event_bus/event_bus.dart';
import 'package:health_care_app/src/core/data/network/dio_client.dart';
import 'package:health_care_app/src/core/data/network/endpoints/endpoints.dart';
import 'package:health_care_app/src/core/data/network/https/dio_config.dart';
import 'package:health_care_app/src/core/data/network/interceptor/auth_interceptor.dart';
import 'package:health_care_app/src/data/network/interceptor/error_interceptor.dart';
import 'package:health_care_app/src/data/network/interceptor/login_interceptor.dart';
import 'package:health_care_app/src/data/share_prefrence/share_prefence_helper.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/utils/https/app_rest_client.dart';

class NetworkModule {
  static Future<void> configureNetworkModuleInjection() async {
    // event bus:---------------------------------------------------------------
    injector.registerSingleton<EventBus>(EventBus());

    // interceptors:------------------------------------------------------------
    injector.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
    injector.registerSingleton<ErrorInterceptor>(ErrorInterceptor(injector()));
    injector.registerSingleton<AuthInterceptor>(
      AuthInterceptor(
        accessToken: () async =>
            await injector<SharedPreferenceHelper>().authToken,
      ),
    );

    // dio:---------------------------------------------------------------------
    injector.registerSingleton<DioConfigs>(
      const DioConfigs(
        connectionTimeout: Endpoints.connectionTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
      ),
    );

    injector.registerSingleton<DioClient>(
      DioClient(dioConfigs: injector<DioConfigs>())
        ..addInterceptors(
          [
            injector<AuthInterceptor>(),
            injector<ErrorInterceptor>(),
            injector<LoggingInterceptor>(),
          ],
        ),
    );

    // rest client:-------------------------------------------------------------
    injector.registerSingleton(RestClient(injector<DioClient>().dio));

    // api's:-------------------------------------------------------------------
    // injector.registerSingleton(
    //     PostApi(injector<DioClient>(), injector<RestClient>()));
  }
}
