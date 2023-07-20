import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static late final SharedPreferences _sharedPreferences;
  static Future<SharedPreferences> get _instance async => _sharedPreferences;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _sharedPreferences = await _instance;
    return _sharedPreferences;
  }

  /// sets
  static Future<bool> setBool(String key, bool value) async =>
      await _sharedPreferences.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _sharedPreferences.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _sharedPreferences.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _sharedPreferences.setStringList(key, value);

  /// gets
  static bool? getBool(String key) => _sharedPreferences.getBool(key);

  static double? getDouble(String key) => _sharedPreferences.getDouble(key);

  static int? getInt(String key) => _sharedPreferences.getInt(key);

  static String? getString(String key) => _sharedPreferences.getString(key);

  static List<String>? getStringList(String key) => _sharedPreferences.getStringList(key);

  /// delete
  static Future<bool> remove(String key) async => await _sharedPreferences.remove(key);

  static Future<bool> clear() async => await _sharedPreferences.clear();
}
