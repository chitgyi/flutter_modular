import 'package:db_module/database.dart';
import 'package:db_module/src/entities/story.dart';
import 'package:drift/drift.dart';

part 'story_dao.g.dart';

@DriftAccessor(tables: [Stories])
class StoryDao extends DatabaseAccessor<Database> with _$StoryDaoMixin {
  StoryDao(super.attachedDatabase);

  Future<void> insert(Story story) async {
    await into(stories).insert(
      story,
      mode: InsertMode.insertOrReplace,
    );
  }

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

  Stream<List<Story>> watchTransactions() {
    return (select(stories)).watch();
  }

  Future<void> deleteAll() async {
    await (delete(stories)).go();
  }
}
