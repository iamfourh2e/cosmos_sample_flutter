import 'package:flutter/material.dart';
import 'storage/storage_service.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  LocaleProvider() {
    _loadSavedLocale();
  }

  Locale get locale => _locale;

  Future<void> _loadSavedLocale() async {
    final savedLocale = await StorageService.getLocale();
    if (savedLocale != null) {
      setLocale(Locale(savedLocale));
    }
  }

  void setLocale(Locale locale) {
    if (!['en', 'es'].contains(locale.languageCode)) return;
    _locale = locale;
    StorageService.saveLocale(locale);
    notifyListeners();
  }
}