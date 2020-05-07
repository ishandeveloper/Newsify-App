import 'package:flutter/material.dart';
import 'package:Newsify/helper/newsapi.dart';
import 'package:Newsify/models/article.dart';

import 'components/article_card.dart';
import 'components/title.dart';
import 'home.dart';

class NewsCategory extends StatefulWidget {
  final String categoryName;

  NewsCategory({this.categoryName});

  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  bool loading = true;
  List<ArticleModel> articles = List<ArticleModel>();
  @override
  void initState() { 
    super.initState();
    getNews();
  }
  getNews() async {
    CategoryNews updatedNews = CategoryNews();
    var newsTopic=widget.categoryName;
    if(newsTopic=='COVID-19'){
      newsTopic='health';
    }
    await updatedNews.getCategoryNews(newsTopic);
    articles = updatedNews.articles;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: lighttheme ? Colors.white : Colors.black,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: lighttheme ? Colors.white : Colors.black,
                ),
                onPressed: () {},
              )
            ],
            centerTitle: false,
            elevation: 0,
            title: NewsifyTitle(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              loading
                  ? Container(
                      height: MediaQuery.of(context).size.height - 80,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          lighttheme ? Colors.white : Colors.black,
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height -110,
                      child: RefreshIndicator(
                        backgroundColor:
                            lighttheme ? Colors.black : Colors.white,
                        color: lighttheme ? Colors.white : Colors.black,
                        onRefresh: () => getNews(),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: articles.length,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ArticleCard(
                                url: articles[index].url,
                                description: articles[index].description,
                                title: articles[index].title,
                                imageUrl: articles[index].imageUrl,
                              );
                            }),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
