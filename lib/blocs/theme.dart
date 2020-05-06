import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  lightTheme() {
    _themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
    notifyListeners();
  }


  darkTheme() {
    _themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
    notifyListeners();
  }
}
