import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeChanger(this._themeData);
  bool initial = true;

  getTheme() => initial ? _themeData = getLightTheme() : _themeData;

  lightTheme() {
    initial = false;
    _themeData = getLightTheme();
    notifyListeners();
  }

  darkTheme() {
    initial = false;
    _themeData = getDarkTheme();
    notifyListeners();
  }

  getDarkTheme() {
    _themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
    return _themeData;
  }

  getLightTheme() {
    _themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
    return _themeData;
  }
}
