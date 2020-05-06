import 'package:flutter/material.dart';

import 'views/home.dart';

void main()=>runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Home()
    );
  }
}