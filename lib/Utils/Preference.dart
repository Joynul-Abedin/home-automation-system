import 'SharedPrefService.dart';

class Preference {
  static bool getBool(String key, {bool defaultValue = false}) {
    return SharedPrefService.pref.getBool(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await SharedPrefService.pref.setBool(key, value);
  }

  static String getString(String key, {String defaultValue = ""}) {
    return SharedPrefService.pref.getString(key) ?? defaultValue;
  }

  // Example method to set a boolean preference
  static Future<void> setString(String key, String value) async {
    await SharedPrefService.pref.setString(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return SharedPrefService.pref.getInt(key) ?? defaultValue;
  }

  // Example method to set a boolean preference
  static Future<void> setInt(String key, int value) async {
    await SharedPrefService.pref.setInt(key, value);
  }

  // Method to clear all stored preferences
  Future<void> clearAll() async {
    await SharedPrefService.pref.clear();
  }
}
