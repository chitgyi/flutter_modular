import 'package:core_module/core_module.dart';
import 'package:story_module/src/domain/repository/story_repo.dart';

class GetStories {
  final StoryRepo _repo;

  GetStories(this._repo);

  Stream<List<Story>> call() {
    return _repo.getStories();
  }
}
