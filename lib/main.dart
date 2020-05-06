import 'package:flutter/material.dart';

import 'views/home.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Newsify',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
