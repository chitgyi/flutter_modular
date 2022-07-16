import 'package:core_module/core_module.dart';

abstract class PostRemoteDatasouce {
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
}
