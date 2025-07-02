import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static late final SharedPreferences prefs;

  /// Call this once in your app's initialization (e.g., main() or initState).
  static Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveString({required String key, required String value}) async {
    await prefs.setString(key, value);
  }

  static Future<void> saveInt({required String key, required int value}) async {
    await prefs.setInt(key, value);
  }

  static Future<void> saveBool({required String key, required bool value}) async {
    await prefs.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return prefs.getBool(key);
  }

  static String? getString({required String key}) {
    return prefs.getString(key);
  }

  static int? getInt({required String key}) {
    return prefs.getInt(key);
  }

  static Future<void> delete({required String key}) async {
    await prefs.remove(key);
  }

  static Future<void> deleteAll() async {
    await prefs.clear();
  }
}
