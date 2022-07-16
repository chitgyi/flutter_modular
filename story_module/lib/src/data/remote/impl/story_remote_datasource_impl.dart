import 'dart:math';

import 'package:core_module/core_module.dart';
import 'package:db_module/database.dart';
import 'package:faker/faker.dart';
import 'package:story_module/src/data/remote/story_remote_data_source.dart';

class StoryRemoteDatasourceImpl implements StoryRemoteDataSource {
  // ignore: unused_field
  final StoryApi _api;
  StoryRemoteDatasourceImpl(this._api);
  @override
  Future<List<Story>> getStories() async {
    // _api.getStories();

    // eg: with fake data
    final faker = Faker();
    final stories = List.generate(
      Random().nextInt(3),
      (index) => Story(
        id: faker.randomGenerator.integer(1000),
        title: faker.person.name(),
        description: faker.lorem.sentence(),
        createdAt: DateTime.now(),
      ),
    );
    Future.delayed(const Duration(seconds: 3));
    return stories;
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    // _api.getTransactions();
    return [];
  }
}
