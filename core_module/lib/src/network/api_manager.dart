import 'package:core_module/core_module.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi()
abstract class ApiManager with StoryApi, PostApi {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;
}
