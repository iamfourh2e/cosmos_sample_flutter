import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class StorageService {
  static const String _localeBoxName = 'locale_box';
  static const String _localeKey = 'current_locale';
  static Box? _localeBox;
  
  static Future<void> init() async {
    debugPrint('Initializing StorageService...');
    final appDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    await _openLocaleBox();
    debugPrint('StorageService initialized');
  }

  static Future<Box> _openLocaleBox() async {
    if (_localeBox != null && _localeBox!.isOpen) {
      return _localeBox!;
    }
    _localeBox = await Hive.openBox(_localeBoxName);
    return _localeBox!;
  }

  static Future<void> saveLocale(Locale locale) async {
    debugPrint('Saving locale: ${locale.languageCode}');
    final box = await _openLocaleBox();
    await box.put(_localeKey, locale.languageCode);
  }

  static Future<String?> getLocale() async {
    final box = await _openLocaleBox();
    final locale = box.get(_localeKey);
    debugPrint('Retrieved locale: $locale');
    return locale;
  }

  static Future<void> dispose() async {
    if (_localeBox != null && _localeBox!.isOpen) {
      await _localeBox!.close();
      _localeBox = null;
    }
  }
}