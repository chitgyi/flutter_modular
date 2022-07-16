import 'package:core_module/core_module.dart';

abstract class StoryRemoteDataSource {
  Future<List<Story>> getStories();
  Future<List<Post>> getPosts();
}
