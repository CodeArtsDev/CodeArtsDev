import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorageAdapter {
  Future set(String key, dynamic data);
  Future<T?> get<T>(String key);
  Future<bool> clear(String key);
}

class LocalStorageAdapter extends IStorageAdapter {
  @override
  Future set(String key, dynamic data) async {
    final prefs = await SharedPreferences.getInstance();

    if (data is String) await prefs.setString(key, data);
    if (data is int) await prefs.setInt(key, data);
    if (data is double) await prefs.setDouble(key, data);
    if (data is bool) await prefs.setBool(key, data);
  }

  @override
  Future<T?> get<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (T is String) return prefs.getString(key) as T;
    if (T is int) return prefs.getInt(key) as T;
    if (T is double) return prefs.getDouble(key) as T;
    if (T is bool) return prefs.getBool(key) as T;

    return null;
  }

  @override
  Future<bool> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
