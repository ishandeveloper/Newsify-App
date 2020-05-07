import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl, title, description, url;

  ArticleCard(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(
                articleLink: url,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 200,
                  width: 500,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
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
      ),
    );
  }
}
