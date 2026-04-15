import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:logger/logger.dart';
import 'package:soft_dream_test/config/log_config.dart';

class Log {
  const Log._();

  static const _enableLog = LogConfig.enableGeneralLog;
  static const _logOnConsole = LogConfig.logOnConsole;
  static void d(
    Object? message, {
    String? name,
    DateTime? time,
  }) {
    _log('💡 $message', name: name ?? '', time: time);
  }

  static void e(
    Object? errorMessage, {
    String? name,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _log(
      '💢 $errorMessage',
      name: name ?? '',
      error: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }

  static String prettyJson(Map<String, dynamic> json) {
    if (!LogConfig.isPrettyJson) {
      return json.toString();
    }

    final indent = '  ' * 2;
    final encoder = JsonEncoder.withIndent(indent);

    return encoder.convert(json);
  }

  static void _log(
    String message, {
    int level = 0,
    String name = '',
    DateTime? time,
    int? sequenceNumber,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (_enableLog) {
      if (_logOnConsole) {
        logger.d(message);
      }
      dev.log(
        message,
        name: name,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

var logger = MyLogger();

class MyLogger {
  static final _logger = Logger();

  /// Log a message at level verbose.
  void v(dynamic message) {
    _logger.t(message);
    // _print("🤍 VERBOSE: $message");
  }

  /// Log a message at level debug.
  void d(dynamic message) {
    //_logger.d(message);
    //_print("💙 DEBUG: $message");
    _logger.d('💙 DEBUG: $message');
  }

  /// Log a message at level info.
  void i(dynamic message) {
    //_logger.i(message);
    //_print("💚️ INFO: $message");
    _logger.i('💚️ INFO: $message');
  }

  /// Log a message at level warning.
  void w(dynamic message) {
    //_logger.w(message);
    //_print("💛 WARNING: $message");
    _logger.w('💛 WARNING: $message');
  }

  /// Log a message at level error.
  void e(dynamic message) {
    //_logger.e(message);
    //_print("❤️ ERROR: $message");
    _logger.e('❤️ ERROR: $message');
  }

  void _print(dynamic message) {
    if (LogConfig.enableGeneralLog) {
      logger.d('$message');
    }
  }

  void _log(dynamic message) {
    if (LogConfig.enableGeneralLog) {
      d(message);
    }
  }

  void log(dynamic message,
      {bool printFullText = false, StackTrace? stackTrace}) {
    if (printFullText) {
      _log(message);
    } else {
      _print(message);
    }
    if (stackTrace != null) {
      _print(stackTrace);
    }
  }
}
