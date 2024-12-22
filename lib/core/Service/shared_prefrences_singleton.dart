import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// Save boolean value
  static Future<void> setBool(String key, bool value) async {
    await _instance.setBool(key, value);
  }

  /// Retrieve boolean value, returning `false` if the key doesn't exist
  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  /// Optionally, return null if key doesn't exist
  static bool? getBoolNullable(String key) {
    return _instance.getBool(key);
  }
  static setString(String key, String value) async {
    await _instance.setString(key, value);
  }
  static getString(String key) {
    return _instance.getString(key) ?? "";
  }
}
