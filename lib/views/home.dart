import 'package:flutter/material.dart';
import 'package:news_app/blocs/theme.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/newsapi.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/views/components/article_card.dart';
import 'package:news_app/views/components/categorytile.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'components/title.dart';

bool lighttheme = false;
bool initial = true;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();
  bool loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News updatedNews = News();
    await updatedNews.getNews();
    articles = updatedNews.articles;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AppBar(
              leading: Icon(
                Icons.receipt,
                size: 30,
                color: lighttheme ? Colors.white : Colors.black,
              ),
              actions: appbarActions(_themechanger),
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
                // //CATEGORIES
                Container(
                  height: 60,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageurl: categories[index].imageURL,
                        name: categories[index].categoryName,
                      );
                    },
                  ),
                ),
                loading
                    ? Container(
                        height: MediaQuery.of(context).size.height - 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            lighttheme ? Colors.white : Colors.black,
                          ),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height - 170,
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
                      )
              ],
            ),
          ),
        ));
  }

  List<Widget> appbarActions(ThemeChanger _themechanger) {
    return <Widget>[
      IconButton(
        icon: Icon(
          Icons.brightness_6,
          color: lighttheme ? Colors.white : Colors.black,
        ),
        onPressed: () {
          lighttheme ? _themechanger.lightTheme() : _themechanger.darkTheme();
          if (lighttheme == true) {
            lighttheme = false;
          } else {
            lighttheme = true;
          }
        },
      ),
      IconButton(
        icon: Icon(
          Icons.info,
          color: lighttheme ? Colors.white : Colors.black,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutPage()));
        },
      )
    ];
  }
}
