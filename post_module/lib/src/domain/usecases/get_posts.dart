import 'package:core_module/core_module.dart';
import 'package:either_dart/either.dart';
import 'package:post_module/src/domain/repos/post_repo.dart';

class GetPosts
    implements StreamUseCase<Either<Failure, List<Post>>, NotParams> {
  final PostRepo postRepo;
  GetPosts(this.postRepo);

  @override
  Stream<Either<Failure, List<Post>>> call(NotParams params) async* {
    try {
      final posts = await postRepo.getPosts();
      yield Right(posts);
      await postRepo.fetchPosts();
      final newPosts = await postRepo.getPosts();
      yield Right(newPosts);
    } on NetworkException {
      yield Left(UnknownFailure('Network Error'));
    }
  }
}
