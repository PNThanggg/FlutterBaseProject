import 'package:flutter_base/build_constants.dart';

import 'log/logger.dart';

class AppLog {
  static Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  static Logger loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  static debug(dynamic message) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      logger.d(message);
    }
  }

  static info(dynamic message) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      // logger.i(message);

      loggerNoStack.i(message);
    }
  }

  static warning(dynamic message) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      loggerNoStack.w(message);
    }
  }

  static error(dynamic message) {
    if (BuildConstants.currentEnvironment == Environment.dev) {
      logger.e(message, 'Error');
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
