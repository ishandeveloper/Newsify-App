import 'package:flutter/material.dart';
import 'package:news_app/blocs/theme.dart';
import 'package:provider/provider.dart';

bool lighttheme = true;
bool initial=true;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themechanger = Provider.of<ThemeChanger>(context);
    
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.brightness_6,color: lighttheme?Colors.white:Colors.black,),
              onPressed: () {
                lighttheme
                    ? _themechanger.lightTheme()
                    : _themechanger.darkTheme();
                if (lighttheme == true) {
                  lighttheme = false;
                } else {
                  lighttheme = true;
                }
              })
        ],
        centerTitle: false,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Newsify',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              'by ishandeveloper',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
