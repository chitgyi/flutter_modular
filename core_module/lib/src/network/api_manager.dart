import 'package:core_module/src/network/story_api.dart';
import 'package:core_module/src/network/transaction_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi()
abstract class ApiManager with StoryApi, TransactionApi {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;
}
