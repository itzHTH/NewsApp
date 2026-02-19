import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class HiveHelper {
  HiveHelper._();
  static final HiveHelper _instance = HiveHelper._();
  factory HiveHelper() => _instance;

  static late Box _box;
  static late LazyBox _lazyBox;

  Future<void> initHive() async {
    await Hive.initFlutter();
  }

  Future<void> openBox(String boxName) async {
    _box = await Hive.openBox(boxName);
  }

  Future<void> openLazyBox(String boxName) async {
    _lazyBox = await Hive.openLazyBox(boxName);
  }

  Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<void> putLazy(String key, dynamic value) async {
    await _lazyBox.put(key, value);
  }

  Future<void> putAll(Map<String, dynamic> map) async {
    await _box.putAll(map);
  }

  dynamic get(String key) {
    return _box.get(key);
  }

  dynamic getLazy(String key) {
    return _lazyBox.get(key);
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> deleteLazy(String key) async {
    await _lazyBox.delete(key);
  }

  Future<void> deleteFromDisk() async {
    await _box.deleteFromDisk();
  }

  Future<void> deleteFromDiskLazy() async {
    await _lazyBox.deleteFromDisk();
  }

  Future<void> clearBox() async {
    await _box.clear();
  }

  Future<void> clearBoxLazy() async {
    await _lazyBox.clear();
  }

  Future<List<dynamic>> getAllLazy() async {
    List<dynamic> list = [];
    var keys = _lazyBox.keys;
    for (var key in keys) {
      list.add(await _lazyBox.get(key));
    }
    return list;
  }

  Future<bool> containsKeyLazy(String key) async {
    return _lazyBox.containsKey(key);
  }
}
