import 'package:core_module/core_module.dart';
import 'package:post_module/src/data/remote/post_remote_datasource.dart';

class PostRemoteDatasourceImpl implements PostRemoteDatasouce {
  final PostApi _api;
  PostRemoteDatasourceImpl(this._api);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await _api.getPosts();
      final data = response.data as List;
      final posts = data.map((e) => Post.fromJson(e)).toList();
      return posts;
    } on DioError catch (e) {
      throw UnknownNetworkException(e.toString());
    }
  }

  @override
  Future<Post> getPost(int id) async {
    try {
      final reposne = await _api.getPost(id);
      final data = reposne.data;
      return Post.fromJson(data);
    } on DioError catch (e) {
      throw UnknownNetworkException(e.toString());
    }
  }
}
