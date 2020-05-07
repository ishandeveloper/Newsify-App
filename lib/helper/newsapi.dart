import 'dart:convert';

import 'package:Newsify/models/article.dart';
import 'package:http/http.dart' as http;

import '../secrets.dart';

class News {
  List<ArticleModel> articles = [];
  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article["urlToImage"] != null && article['description'] != null) {
          ArticleModel newArticles = ArticleModel(
            title: article['title'],
            description: article['description'],
            imageUrl: article['urlToImage'],
            author: article['author'],
            url: article['url'],
            // publishedAt: article['publishedAt'],
          );
          articles.add(newArticles);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> articles = [];
  Future<void> getCategoryNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=$apiKey';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article["urlToImage"] != null && article['description'] != null) {
          ArticleModel newArticles = ArticleModel(
            title: article['title'],
            description: article['description'],
            imageUrl: article['urlToImage'],
            author: article['author'],
            url: article['url'],
            // publishedAt: article['publishedAt'],
          );
          articles.add(newArticles);
        }
      });
    }
  }
}
