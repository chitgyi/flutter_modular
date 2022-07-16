import 'package:core_module/src/database/database.dart';
import 'package:core_module/src/database/entities/post.dart';
import 'package:drift/drift.dart';

part 'post_dao.g.dart';

abstract class PostDao {
  Future<void> insert(Post post);
  Stream<List<Post>> watchPosts();
}

@DriftAccessor(tables: [Posts])
class PostDaoImpl extends DatabaseAccessor<Database>
    with PostDao, _$PostDaoImplMixin {
  PostDaoImpl(super.attachedDatabase);

  // @override
  @override
  Future<void> insert(Post post) async {
    await into(posts).insert(post);
  }

  // @override
  @override
  Stream<List<Post>> watchPosts() {
    return (select(posts)).watch();
  }
}
