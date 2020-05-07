import 'package:flutter/material.dart';

class NewsifyTitle extends StatelessWidget {
  const NewsifyTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Newsify',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
          'by ishandeveloper',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}