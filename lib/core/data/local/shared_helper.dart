import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  SharedPrefsHelper._();

  static final SharedPrefsHelper _instance = SharedPrefsHelper._();

  factory SharedPrefsHelper() => _instance;

  late SharedPreferences _sharedPreferences;

  Future<void> initShared() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getStringValue(String key) => _sharedPreferences.getString(key);

  bool? getBoolValue(String key) => _sharedPreferences.getBool(key);

  int? getIntValue(String key) => _sharedPreferences.getInt(key);

  Future<bool?> setStringValue(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  Future<bool?> setBoolValue(String key, bool value) async =>
      await _sharedPreferences.setBool(key, value);

  Future<bool?> setIntValue(String key, int value) async =>
      await _sharedPreferences.setInt(key, value);

  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }
}
