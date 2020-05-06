import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Newsify',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'by ishandeveloper',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
