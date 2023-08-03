import 'package:flutter_base/build_constants.dart';

import '../base/log/logger.dart';

class AppLog {
  static Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  static Logger loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  static debug(dynamic message, {String tag = "Debug"}) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      // logger.d(message, tag);

      loggerNoStack.d(message, tag);
    }
  }

  static info(dynamic message, {String tag = "Info"}) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      // logger.i(message);

      loggerNoStack.i(message, tag);
    }
  }

  static warning(dynamic message, {String tag = "Warning"}) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      loggerNoStack.w(message, tag);
    }
  }

  static error(dynamic message, {String tag = "Error"}) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      logger.e(message, tag);
    }
  }

  static verbose(dynamic message) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      logger.v(message);
    }
  }

  static logWtf(dynamic message) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      // logger.wtf(message);

      loggerNoStack.wtf(message);
    }
  }
}
