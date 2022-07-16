import 'package:core_module/core_module.dart';

abstract class StoryLocalDatasouce {
  Stream<List<Story>> getStories();
  Future<void> insertStory(Story story);
  Future<void> insertStories(List<Story> stories);
}
