import 'dart:developer' as developer;

abstract class Logger {
  static void log(String message, {String tag = 'Logger'}) {
    developer.log(message, name: tag);
  }
}
