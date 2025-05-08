import 'package:flutter/material.dart';
import '../storage/storage_service.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    _loadSavedTheme();
  }

  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> _loadSavedTheme() async {
    final savedTheme = await StorageService.getThemeMode();
    if (savedTheme != null) {
      _isDarkMode = savedTheme;
      notifyListeners();
    }
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    StorageService.saveThemeMode(_isDarkMode);
    notifyListeners();
  }
}