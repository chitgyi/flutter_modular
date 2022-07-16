// ignore_for_file: implementation_imports

import 'package:core_module/core_module.dart';
import 'package:post_module/src/data/local/post_local_datasource.dart';
import 'package:post_module/src/data/remote/post_remote_datasource.dart';
import 'package:post_module/src/domain/repos/post_repo.dart';

class PostRepoImpl implements PostRepo {
  final PostLocalDatasource _localDatasource;
  final PostRemoteDatasouce _remoteDatasource;

  PostRepoImpl(this._localDatasource, this._remoteDatasource);
  @override
  Future<Post> getPost(int id) async {
    return _localDatasource.getPost(id);
  }

  @override
  Stream<List<Post>> watchPosts() {
    _remoteDatasource
        .getPosts()
        .then((posts) => _localDatasource.savePosts(posts));
    return _localDatasource.watchPosts();
  }

  @override
  Future<List<Post>> getPosts() async {
    return await _localDatasource.getPosts();
  }

  @override
  Future<void> fetchPosts() async {
    final posts = await _remoteDatasource.getPosts();
    _localDatasource.savePosts(posts);
  }

  @override
  Future<void> fetchPost(int id) async {
    final post = await _remoteDatasource.getPost(id);
    await _localDatasource.savePosts([post]);
  }
}
