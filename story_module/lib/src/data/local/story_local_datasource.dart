import 'package:db_module/database.dart';

abstract class StoryLocalDatasouce {
  Stream<List<Story>> getStories();
  Future<void> insertStory(Story story);
  Future<void> insertStories(List<Story> stories);
}
