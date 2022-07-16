abstract class Failure {
  String get message;
}

class UnknownFailure implements Failure {
  final String msg;
  UnknownFailure([this.msg = 'Unknown Error']);

  @override
  String get message => msg;
}
