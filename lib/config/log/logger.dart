import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(),
  filter: null,
  output: null,
);

class Log {
  static void d(String msg) {
    if (!kReleaseMode) {
      _logger.d(msg);
    }
  }

  static void e(String msg) {
    if (!kReleaseMode) {
      _logger.e(msg);
    }
  }
}
