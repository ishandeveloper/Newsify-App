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
              Image.network(imageUrl,height: 200, width:500,fit: BoxFit.cover,),
              SizedBox(height: 8,),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3,),
              Text(
                description,
                style: TextStyle(
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
