import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/WelcomePage.dart';
import 'package:flutter_app/screens/samplepage.dart';
import 'screens/SignInPage.dart';
import 'screens/SignUpPage.dart';
import 'screens/Dashboard.dart';
import 'screens/ProductPage.dart';
import 'package:firebase_core/firebase_core.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
     future: Firebase.initializeApp(),
      builder: (context, snapshot) {
    if(snapshot.connectionState == ConnectionState.done){
      return MaterialApp(
        title: 'Fryo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        //home: WelcomePage(pageTitle: 'Welcome'),
        home: HomePage(),
        routes: <String, WidgetBuilder> {
          '/signup': (BuildContext context) =>  SignUpPage(),
          '/signin': (BuildContext context) =>  SignInPage(),
          '/dashboard': (BuildContext context) => Dashboard(),
          '/productPage': (BuildContext context) => ProductPage(),
        },
      );
    }
    //return SamplePage();

      }
    );
  }
}
