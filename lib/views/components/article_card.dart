import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {

  final String imageUrl,title,description;

  ArticleCard({@required this.imageUrl,@required this.title,@required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Image.network(imageUrl),
        Text(title),
      Text(description)
      ],),
    );
  }
}