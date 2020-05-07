import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final imageurl, name;
  CategoryTile({this.imageurl, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            imageurl,
            width: 120,
            height: 60,
          ),
        
        ],
      ),
    );
  }
}
