import 'dart:async';

import 'package:core_module/core_module.dart';
import 'package:faker/faker.dart';
import 'package:story_module/src/domain/repository/story_repo.dart';
import 'package:story_module/src/domain/usecases/get_stories.dart';
import 'package:vmb/vmb.dart';

class StoryViewModel extends Vmb<StoryState> {
  StoryViewModel(this._repo) : super(StoryState.loading());
  final StoryRepo _repo;

  StreamSubscription? _subscription;

  void loadStories() {
    _subscription = GetStories(_repo)().listen((stories) {
      value = StoryState.success(stories);
    }, onError: (error) {
      value = StoryState.error(error.toString());
    });
  }

  Future<void> insertFakerStory() async {
    final faker = Faker();
    final story = Story(
      id: faker.randomGenerator.integer(100),
      title: faker.person.name(),
      description: faker.lorem.sentence(),
    );
    await _repo.insertStory(story);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

class StoryState extends BaseState<List<Story>> {
  StoryState({
    super.value,
    required super.viewState,
    super.errorMessage,
  });

  factory StoryState.loading() => StoryState(viewState: ViewState.loading);

  factory StoryState.error(String message) => StoryState(
        viewState: ViewState.failed,
        errorMessage: message,
      );

  factory StoryState.success(List<Story> stories) => StoryState(
        viewState: ViewState.success,
        value: stories,
      );
}
