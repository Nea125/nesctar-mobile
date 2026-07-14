import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const firstLaunchKey = "first_launch";

  static Future<bool> setFirstLaunch({required bool isFirstLaunch}) async {
    return await _prefs!.setBool(firstLaunchKey, isFirstLaunch);
  }

  static bool getFirstLaunch() {
    return _prefs?.getBool(firstLaunchKey) ?? true;
  }
}