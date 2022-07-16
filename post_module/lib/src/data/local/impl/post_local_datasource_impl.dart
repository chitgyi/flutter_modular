import 'package:core_module/core_module.dart';
import 'package:post_module/src/data/local/post_local_datasource.dart';

class PostLocalDatasourceImpl implements PostLocalDatasource {
  final PostDao _postDao;
  PostLocalDatasourceImpl(this._postDao);

  @override
  Future<Post> getPost(int id) {
    return _postDao.getPost(id);
  }

  @override
  Future<void> savePosts(List<Post> story) {
    return _postDao.insertAll(story);
  }

  @override
  Stream<List<Post>> watchPosts() {
    return _postDao.watchPosts();
  }

  @override
  Future<List<Post>> getPosts() {
    return _postDao.getPosts();
  }
}
