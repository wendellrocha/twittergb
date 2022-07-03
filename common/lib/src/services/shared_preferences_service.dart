import 'dart:async';
import 'dart:convert';

import 'package:dependencies/dependencies.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;
  static Completer<SharedPreferencesService>? _completer;
  SharedPreferencesService._(this._prefs);

  static Future<SharedPreferencesService> getInstance() async {
    if (_completer == null) {
      final completer = Completer<SharedPreferencesService>();
      final sharedPreferences = await SharedPreferences.getInstance();
      completer.complete(SharedPreferencesService._(sharedPreferences));
      _completer = completer;
      return _completer!.future;
    }
    return _completer!.future;
  }

  Future<void> reload() async {
    await _prefs.reload();
  }

  Future<Map<String, dynamic>?>? getObject(String key) async {
    if (_prefs.getString(key) != null) {
      return json.decode(_prefs.getString(key)!);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?>? getObjectFuture(String key) async {
    if (_prefs.getString(key) != null) {
      return json.decode(_prefs.getString(key)!);
    } else {
      return null;
    }
  }

  void setObject(String key, value) async {
    _prefs.setString(key, json.encode(value));
  }

  Future<bool> getBool(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  void setBool(String key, bool b) async {
    _prefs.setBool(key, b);
  }

  Future<int> getInt(String key) async {
    return _prefs.getInt(key) ?? 0;
  }

  void setInt(String key, int i) async {
    _prefs.setInt(key, i);
  }

  Future<String> getString(String key) async {
    return _prefs.getString(key) ?? '';
  }

  void setString(String key, String s) async {
    _prefs.setString(key, s);
  }

  void remove(String key) async {
    _prefs.remove(key);
  }

  Future<void> clear() async {
    _prefs.clear();
  }
}
