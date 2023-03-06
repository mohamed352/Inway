import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedpreferences;
  static init() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData(String key) {
    return sharedpreferences.get(key);
  }

  static Future<bool> savedata(String key, dynamic value) async {
    if (value is String) return await sharedpreferences.setString(key, value);
    if (value is double) return await sharedpreferences.setDouble(key, value);
    if (value is bool) return await sharedpreferences.setBool(key, value);
    return await sharedpreferences.setInt(key, value);
  }

  static Future<bool> removeData(String key) async {
    return sharedpreferences.remove(key);
  }
}
