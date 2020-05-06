import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {

  ThemeData _themeData=ThemeData.light();

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
      scaffoldBackgroundColor: Colors.grey[850],
      appBarTheme: AppBarTheme(
        color: Colors.grey[900],
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
    notifyListeners();
  }
}
