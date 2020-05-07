import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
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
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Newsify',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 2000),
              text: ['For Stories That Matter.'],
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
                    color: Colors.black,
                  ),
                ),
                Text(
                  " ishandeveloper",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
