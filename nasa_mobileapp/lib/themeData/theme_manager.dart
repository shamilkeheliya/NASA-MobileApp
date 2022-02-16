import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/themeData/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    //primaryColor: const Color(0xFF0B3D91),
    primaryColor: const Color(0xFF021f4f),
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    canvasColor: Colors.white,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    //canvasColor: const Color(0xFF021f4f),
    canvasColor: const Color(0xFF0B3D91),
  );

  ThemeData _themeData = ThemeData(
    primaryColor: const Color(0xFF021f4f),
  );
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      //print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'dark';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        //print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
