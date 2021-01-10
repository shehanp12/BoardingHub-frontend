import 'package:flutter/material.dart';
import 'package:flutter_app/screens/FeedPage.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/Splashscreen.dart';
import 'package:flutter_app/screens/hamburger/Hambueger.dart';
import 'package:flutter_app/utils/RestService.dart';
import 'package:flutter_app/widgets/Loading_Screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization/language_constants.dart';
import 'localization/demo_localization.dart';
import 'screens/auth/SignInPage.dart';
import 'screens/auth/SignUpPage.dart';
import 'screens/viewData/ProductPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newlocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newlocale);
  }

  static void setLocaleSettings(BuildContext context, Locale newlocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newlocale);
  }

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences prefs;
  RestService restService = RestService();
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    // restService.getBoarding();
  }

  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GetMaterialApp(
              title: 'Fryo',
              theme: ThemeData(
                primarySwatch: Colors.orange,
              ),
              //home: AdsScreen(),
              home: MenudrawerPage(),
             

              routes: <String, WidgetBuilder>{
                '/signup': (BuildContext context) => SignUpPage(),
                '/signin': (BuildContext context) => SignInPage(),
                '/productPage': (BuildContext context) => ProductPage(),
              },
              locale: _locale,
              supportedLocales: [
                Locale('en', 'US'),
                Locale('si', 'SN'),
              ],
              localizationsDelegates: [
                DemoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
            );
          }
          return Loading();
        });
  }
}
