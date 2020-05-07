import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'components/title.dart';
import 'home.dart';

class ArticleView extends StatefulWidget {
  final String articleLink;
  ArticleView({this.articleLink});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
   num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
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
              onTap: (){
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
      body: IndexedStack(
        index: _stackToView,
        children: <Widget>[
          Container(
            child: WebView(
              onPageFinished: _handleLoad,
              javascriptMode: JavascriptMode.disabled,
              initialUrl: widget.articleLink,
              
            ),

          ),
          Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                            lighttheme ? Colors.white : Colors.black,
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
