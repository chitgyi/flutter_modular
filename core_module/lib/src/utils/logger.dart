import 'dart:developer' as developer;

abstract class Logger {
  static void log(String message) {
    developer.log(message);
  }
}
