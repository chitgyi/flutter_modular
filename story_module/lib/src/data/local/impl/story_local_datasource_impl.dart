import 'package:core_module/core_module.dart';
import 'package:story_module/src/data/local/story_local_datasource.dart';

class StoryLocalDatasourceImpl implements StoryLocalDatasouce {
  final StoryDao _storyDao;

  StoryLocalDatasourceImpl(this._storyDao);

  @override
  Stream<List<Story>> getStories() {
    return _storyDao
        .watchPosts()
        .map((event) => event..sort(((a, b) => a.title.compareTo(b.title))));
  }

  @override
  Future<void> insertStory(Story story) async {
    await _storyDao.insert(story);
  }

  @override
  Future<void> insertStories(List<Story> stories) async {
    // await _storyDao.deleteAll();
    await _storyDao.insertAll(stories);
  }
}
