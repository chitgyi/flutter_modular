import 'package:core_module/src/database/database.dart';
import 'package:core_module/src/database/entities/post.dart';
import 'package:drift/drift.dart';

part 'post_dao.g.dart';

abstract class PostDao {
  Future<void> insert(Post post);
  Future<void> insertAll(List<Post> newPosts);
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts();
  Stream<List<Post>> watchPosts();
}

@DriftAccessor(tables: [Posts])
class PostDaoImpl extends DatabaseAccessor<Database>
    with PostDao, _$PostDaoImplMixin {
  PostDaoImpl(super.attachedDatabase);

  @override
  Future<void> insert(Post post) async {
    await into(posts).insert(post, mode: InsertMode.insertOrReplace);
  }

  @override
  Stream<List<Post>> watchPosts() {
    return (select(posts)).watch();
  }

  @override
  Future<Post> getPost(int id) {
    final query = select(posts)..where((tbl) => tbl.id.equals(id));
    return query.getSingle();
  }

  @override
  Future<void> insertAll(List<Post> newPosts) {
    return batch((batch) {
      for (final post in newPosts) {
        batch.insert(posts, post, mode: InsertMode.insertOrReplace);
      }
    });
  }

  @override
  Future<List<Post>> getPosts() {
    final query = select(posts);
    return query.get();
  }
}
