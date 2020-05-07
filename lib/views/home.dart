import 'package:flutter/material.dart';
import 'package:news_app/blocs/theme.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/views/components/categorytile.dart';
import 'package:provider/provider.dart';

import 'components/title.dart';

bool lighttheme = false;
bool initial = true;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
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
        body: Container(
          child: Column(
            
            children: <Widget>[
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imageurl: categories[index].imageURL,
                      name: categories[index].categoryName,
                    );
                  },
                ),
              )
            ],
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
        onPressed: () {},
      )
    ];
  }
}
