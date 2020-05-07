import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:Newsify/views/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController mainController;
  Animation mainAnimation;

  @override
  void initState() {
    super.initState();
    mainController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    mainAnimation = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(mainController);
    mainController.forward();
    mainController.addListener(() {
      setState(() {});
    });
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Icon(
              Icons.receipt,
              size: 150,
              color: mainAnimation.value,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Newsify',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  color: mainAnimation.value),
            ),
            SizedBox(
              height: 5,
            ),
            TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 50),
              totalRepeatCount: 1,
              text: ['For Stories That Matter.'],
              textStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
            ),
            Expanded(child: Divider()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Made with ❤ by",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    color: mainAnimation.value,
                  ),
                ),
                Text(
                  " ishandeveloper",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: mainAnimation.value,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
