import 'package:dio/dio.dart';
import 'package:health_care_app/src/domain/entity/post.dart';
import 'package:retrofit/retrofit.dart';

part 'app_rest_client.g.dart';

@RestApi(baseUrl: 'https://wwww.google.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/test')
  Future<List<Post>> getAllSortedByFilter(@Body() Map<String, dynamic> body);
}
