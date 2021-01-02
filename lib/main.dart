import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Splash.dart';
import 'package:flutter_app/screens/auth/WelcomeUserPage.dart';
import 'screens/auth/SignInPage.dart';
import 'screens/auth/SignUpPage.dart';
import 'screens/viewData/ProductPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fryo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      //home: WelcomePage(pageTitle: 'Welcome'),
      home: WelcomePage(),

      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignUpPage(),
        '/signin': (BuildContext context) => SignInPage(),
        '/productPage': (BuildContext context) => ProductPage(),
      },
    );
  }
}
