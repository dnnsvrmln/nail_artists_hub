import 'package:logger/logger.dart';

class CommonsLogger {
  static final _logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  final String loggerClass;

  CommonsLogger({required this.loggerClass});

  void logInfo(String message) {
    _logger.i('[$loggerClass] - $message');
  }

  void logDebug(String message) {
    _logger.d('[$loggerClass] - $message');
  }

  void logWarning(String message) {
    _logger.w('[$loggerClass] - $message');
  }

  void logError(String message) {
    _logger.e('[$loggerClass] - $message');
  }
}
