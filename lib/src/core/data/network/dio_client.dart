import 'package:dio/dio.dart';
import 'package:health_care_app/src/core/data/network/https/dio_config.dart';

class DioClient {
  final DioConfigs dioConfigs;
  final Dio _dio;

  DioClient({required this.dioConfigs})
      : _dio = Dio()
          ..options.connectTimeout =
              Duration(milliseconds: dioConfigs.connectionTimeout)
          ..options.receiveTimeout =
              Duration(milliseconds: dioConfigs.receiveTimeout);

  Dio get dio => _dio;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return _dio..interceptors.addAll(interceptors);
  }
}
