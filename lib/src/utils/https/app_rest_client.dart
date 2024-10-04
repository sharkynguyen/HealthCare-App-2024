import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_rest_client.g.dart';

@RestApi(baseUrl: 'https://wwww.google.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/send-code-register')
  Future<String> getData(@Body() Map<String, dynamic> body);
}
