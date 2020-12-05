import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/samplepage.dart';
import './src/screens/SignInPage.dart';
import './src/screens/SignUpPage.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';
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
          primarySwatch: Colors.green,
        ),
        home: HomePage(pageTitle: 'Welcome'),
        routes: <String, WidgetBuilder> {
          '/signup': (BuildContext context) =>  SignUpPage(),
          '/signin': (BuildContext context) =>  SignInPage(),
          '/dashboard': (BuildContext context) => Dashboard(),
          '/productPage': (BuildContext context) => ProductPage(),
        },
      );
    }
    return SamplePage();

      }
    );
  }
}
