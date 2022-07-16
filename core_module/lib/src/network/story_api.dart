import 'package:retrofit/retrofit.dart';

abstract class StoryApi {
  @GET("/stories")
  Future<HttpResponse> getStories();
}
