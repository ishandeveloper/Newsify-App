import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl, title, description;

  ArticleCard(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: <Widget>[
              Image.network(imageUrl),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
