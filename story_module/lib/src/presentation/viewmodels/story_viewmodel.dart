import 'package:db_module/database.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:story_module/src/domain/repository/story_repo.dart';
import 'package:story_module/src/domain/usecases/get_stories.dart';
import 'package:story_module/src/presentation/viewmodels/view_state.dart';

class StoryViewModel extends ValueNotifier<StoryState> {
  StoryViewModel(this._repo) : super(StoryState.loading());
  final StoryRepo _repo;

  void loadStories() {
    GetStories(_repo)().listen((stories) {
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
}

class StoryState extends State<List<Story>> {
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

abstract class State<T> {
  final T? value;
  final ViewState viewState;
  final String? errorMessage;

  State({
    this.value,
    required this.viewState,
    this.errorMessage,
  });

  Widget observe(
    Widget Function(T viewModel) onSuccess, {
    Widget Function(String errorMessage)? onError,
    Widget Function()? onLoading,
  }) {
    switch (viewState) {
      case ViewState.success:
        return onSuccess(value as T);
      case ViewState.failed:
        return onError == null
            ? Center(
                child: Text(errorMessage!),
              )
            : onError.call(errorMessage!);
      case ViewState.loading:
        return onLoading == null
            ? const Center(child: CircularProgressIndicator())
            : onLoading.call();
    }
  }
}
