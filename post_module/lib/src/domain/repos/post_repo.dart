import 'package:core_module/core_module.dart';

abstract class PostRepo {
  Future<void> fetchPosts();
  Future<List<Post>> getPosts();
  Stream<List<Post>> watchPosts();
  Future<void> fetchPost(int id);
  Future<Post> getPost(int id);
}
