import 'package:db_module/database.dart';

abstract class StoryRepo {
  Stream<List<Story>> getStories();
  Future<void> insertStory(Story story);
}
