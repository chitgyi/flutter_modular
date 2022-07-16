abstract class UseCase<R, P> {
  Future<R> call(P params);
}

abstract class StreamUseCase<R, P> {
  Stream<R> call(P params);
}

class NotParams {}
