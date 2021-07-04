import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  Future<bool> cache(String key, dynamic data) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      return await prefs.setString(key, data.toString());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getCache(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      return prefs.getString(key);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> deleteCache(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      return await prefs.remove(key);
    } catch (e) {
      throw Exception(e);
    }
  }
}
