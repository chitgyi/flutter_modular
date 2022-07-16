import 'package:core_module/core_module.dart';
import 'package:story_module/src/data/local/story_local_datasource.dart';
import 'package:story_module/src/data/remote/story_remote_data_source.dart';
import 'package:story_module/src/domain/repository/story_repo.dart';

class StoryRepoImpl implements StoryRepo {
  final StoryLocalDatasouce _localDatasouce;
  final StoryRemoteDataSource _remoteDataSource;

  StoryRepoImpl(this._localDatasouce, this._remoteDataSource);

  @override
  Stream<List<Story>> getStories() {
    _remoteDataSource.getStories().then((stories) {
      _localDatasouce.insertStories(stories);
    });
    return _localDatasouce.getStories();
  }

  @override
  Future<void> insertStory(Story story) {
    return _localDatasouce.insertStory(story);
  }
}
