import 'dart:io';

enum Environment { dev, prod }

class BuildConstants {
  static Map<String, dynamic> _config = _Config.devConstants;
  static var currentEnvironment = Environment.dev;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.prod:
        _config = _Config.prodConstants;
        currentEnvironment = Environment.prod;
        break;

      case Environment.dev:
        _config = _Config.devConstants;
        currentEnvironment = Environment.dev;
        break;
    }
  }

  static get apiUrl {
    return _config[_Config.apiBase];
  }
}

class _Config {
  static const apiBase = "API_BASE";

  /// prod
  static Map<String, dynamic> prodConstants = {
    apiBase: "http://8.9.31.66:8000",
  };

  static Map<String, dynamic> devConstants = {
    apiBase: "http://8.9.31.66:8000",
  };
}
