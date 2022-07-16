import 'package:core_module/core_module.dart';

abstract class PostLocalDatasource {
  Stream<List<Post>> watchPosts();
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
  Future<void> savePosts(List<Post> post);
}
