import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeTheme extends ChangeNotifier {
  final String key = 'theme';
  SharedPreferences? _sharedPreferences;
  bool? isDark;
  bool get getDark => isDark!;

  ChangeTheme() {
    isDark = true;
    loadPrefrence();
  }

  toggleTheme() {
    isDark = !isDark!;
    savePrefrence();
    notifyListeners();
  }

  prefrences() async {
    _sharedPreferences ??=
        _sharedPreferences = await SharedPreferences.getInstance();
  }

  savePrefrence() async {
    await prefrences();
    isDark = await _sharedPreferences!.setBool(key, isDark!);
  }

  loadPrefrence() async {
    await prefrences();
    _sharedPreferences!.getBool(key) ?? true;
  }
}
