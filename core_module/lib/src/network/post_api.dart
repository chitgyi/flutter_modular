import 'package:retrofit/retrofit.dart';

abstract class PostApi {
  @GET("/posts")
  Future<HttpResponse> getPosts();
}
