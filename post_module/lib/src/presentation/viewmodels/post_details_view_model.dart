import 'dart:async';

import 'package:core_module/core_module.dart';
import 'package:get/get.dart';
import 'package:post_module/src/domain/repos/post_repo.dart';
import 'package:post_module/src/domain/usecases/get_post.dart';
import 'package:vmb/vmb.dart';

class PostDetailsViewModel extends Vmb<BaseState<Post>> {
  PostDetailsViewModel(this._postRepo) : super(PostDetailsState.loading());
  final PostRepo _postRepo;
  StreamSubscription? _subscription;

  Future<void> loadPost() async {
    final id = int.parse(Get.parameters['id'].toString());
    final getPosts = GetPost(_postRepo);
    _subscription = getPosts(GetPostParams(id)).listen((either) {
      either.fold(
        (left) => value = PostDetailsState.failed(left.message),
        (right) => value = PostDetailsState.success(right),
      );
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

class PostDetailsState extends BaseState<Post> {
  PostDetailsState() : super.loading();

  PostDetailsState.success(Post data) : super.success(data);
  PostDetailsState.failed(String message) : super.failed(message);
  PostDetailsState.loading() : super.loading();
}
