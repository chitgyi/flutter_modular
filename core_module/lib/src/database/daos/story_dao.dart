import 'package:core_module/core_module.dart';
import 'package:core_module/src/database/entities/entities.dart';
import 'package:drift/drift.dart';

part 'story_dao.g.dart';

abstract class StoryDao {
  Future<void> insert(Story story);
  Future<void> insertAll(List<Story> newStories);
  Stream<List<Story>> watchPosts();
  Future<void> deleteAll();
}

@DriftAccessor(tables: [Stories])
class StoryDaoImpl extends DatabaseAccessor<Database>
    with StoryDao, _$StoryDaoImplMixin {
  StoryDaoImpl(super.attachedDatabase);

  @override
  Future<void> insert(Story story) async {
    await into(stories).insert(
      story,
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<void> insertAll(List<Story> newStories) async {
    await batch((batch) {
      for (final story in newStories) {
        batch.insert(
          stories,
          story,
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Stream<List<Story>> watchPosts() {
    return (select(stories)).watch();
  }

  @override
  Future<void> deleteAll() async {
    await (delete(stories)).go();
  }
}
