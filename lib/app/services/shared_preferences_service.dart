import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_nexmuv/app/interfaces/local_storage.dart';

class SharedPreferencesService implements ILocalStorage {
  @override
  Future<void> delete({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
  }

  @override
  Future<String?> get({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  @override
  Future<void> put({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }
}
