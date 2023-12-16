import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

/// Types supported: [String]/[int]/[double]/[bool]/[List] <[String]>
class LocalStorageSharedPrefs implements LocalStorageService {
  final SharedPreferences _sharedPreferences;

  LocalStorageSharedPrefs(this._sharedPreferences);

  @override
  bool contains(String key) {
    return _sharedPreferences.containsKey(key);
  }

  /// Types supported: [String]/[int]/[double]/[bool]/[List] <[String]>
  @override
  T? read<T>(String key) {
    try {
      final result = _sharedPreferences.get(key);
      if (result == null) return null;
      if (result is List && T == List<String>) {
        return result.map((e) => e.toString()).toList() as T;
      }
      return result as T?;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return null;
    }
  }

  /// Types supported: [String]/[int]/[double]/[bool]/[List] <[String]>
  @override
  Future<void> write<T>(String key, T value) async {
    try {
      if (T == String) {
        _sharedPreferences.setString(key, value as String);
      } else if (T == int) {
        _sharedPreferences.setInt(key, value as int);
      } else if (T == bool) {
        _sharedPreferences.setBool(key, value as bool);
      } else if (T == double) {
        _sharedPreferences.setDouble(key, value as double);
      } else if (T == List<String>) {
        _sharedPreferences.setStringList(key, value as List<String>);
      } else {
        const String message = 'Type not supported';
        throw Exception(message);
      }
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return;
    }
  }

  @override
  Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  void clear({required bool areYouSure}) {
    if (areYouSure) {
      _sharedPreferences.clear();
    }
  }
}
