import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenrencesService {
  saveToLocalPrefs(value, String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else {
      var stringValue = jsonEncode(value);
      prefs.setString(key, stringValue);
    }
  }

  getLocalPrefs(String key, returnType) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(key)) return;

    var result;

    if (returnType is bool) {
      result = prefs.getBool(key);
    } else if (returnType is double) {
      result = prefs.getDouble(key);
    } else if (returnType is int) {
      result = prefs.getInt(key);
    } else if (returnType is String) {
      result = prefs.getString(key);
    } else if (returnType is List<String>) {
      result = prefs.getStringList(key);
    } else {
      var data = prefs.getString(key) ?? '';
      result = jsonDecode(data);
    }
    return result;
  }

  removeToLocalPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var result = prefs.remove(key);
    return result;
  }

  clearLocalPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    bool result = await prefs.clear();
    return result;
  }

  clearLocalPrefsExcept(List<String> listKey) async {
    final prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();

    for (var key in keys) {
      if (!listKey.contains(key)) {
        bool result = await prefs.remove(key);
        if (!result) {
          return false;
        }
      }
    }
  }
}
