import 'package:retrofit/retrofit.dart';

abstract class PostApi {
  @GET("/posts")
  Future<HttpResponse> getPosts();

  @GET("/posts/{id}")
  Future<HttpResponse> getPost(@Path("id") int id);
}
