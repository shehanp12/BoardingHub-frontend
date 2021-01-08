import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/WelcomeUserPage.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => new _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        //navigateAfterSeconds:WelcomePage(),
        
        image: Image.asset('images/welcomenew.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}