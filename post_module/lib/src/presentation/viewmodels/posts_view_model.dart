import 'dart:async';

import 'package:core_module/core_module.dart';
import 'package:post_module/src/domain/repos/post_repo.dart';
import 'package:post_module/src/domain/usecases/get_posts.dart';
import 'package:vmb/vmb.dart';

class PostsViewModel extends Vmb<BaseState<List<Post>>> {
  PostsViewModel(this._postRepo) : super(PostsState.loading());
  final PostRepo _postRepo;

  StreamSubscription? _subscription;

  Future<void> loadPosts() async {
    final getPosts = GetPosts(_postRepo);
    _subscription = getPosts(NotParams()).listen((either) {
      either.fold(
        (left) => value = PostsState.failed(left.message),
        (right) => value = PostsState.success(right),
      );
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

class PostsState extends BaseState<List<Post>> {
  PostsState() : super.loading();

  PostsState.success(List<Post> data) : super.success(data);
  PostsState.failed(String message) : super.failed(message);
  PostsState.loading() : super.loading();
}
