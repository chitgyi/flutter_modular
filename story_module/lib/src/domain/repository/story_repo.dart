import 'package:core_module/core_module.dart';

abstract class StoryRepo {
  Stream<List<Story>> getStories();
  Future<void> insertStory(Story story);
}
