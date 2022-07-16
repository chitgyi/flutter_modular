import 'package:core_module/core_module.dart';
import 'package:either_dart/either.dart';
import 'package:post_module/src/domain/repos/post_repo.dart';

class GetPost implements StreamUseCase<Either<Failure, Post>, GetPostParams> {
  final PostRepo _repo;
  GetPost(this._repo);
  @override
  Stream<Either<Failure, Post>> call(GetPostParams params) async* {
    try {
      final post = await _repo.getPost(params.id);
      yield Right(post);
      await _repo.fetchPost(params.id);
      final newPost = await _repo.getPost(params.id);
      yield Right(newPost);
    } on NetworkException catch (e) {
      yield Left(UnknownFailure(e.toString()));
    }
  }
}

class GetPostParams {
  final int id;
  GetPostParams(this.id);
}
