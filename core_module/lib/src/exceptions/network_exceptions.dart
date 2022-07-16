abstract class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class UnknownNetworkException extends NetworkException {
  UnknownNetworkException(String message) : super(message);
}
