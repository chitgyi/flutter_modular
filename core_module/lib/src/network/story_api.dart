import 'package:retrofit/retrofit.dart';

abstract class StoryApi {
  @GET("/stories")
  Future<HttpResponse> getStories();

  @GET("/stories/{id}")
  Future<HttpResponse> getStory(@Path("id") int id);
}
