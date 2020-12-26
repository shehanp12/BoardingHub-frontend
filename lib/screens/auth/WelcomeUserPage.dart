import 'package:flutter/material.dart';
import '../../shared/Styles.dart';
import '../../shared/Colors.dart';
import '../../shared/Buttons.dart';
import 'package:flutter_app/localization/language_constants.dart';

import 'package:page_transition/page_transition.dart';
import 'SignUpPage.dart';
import 'SignInPage.dart';
import '../../classes/language.dart';
import 'package:flutter_app/main.dart';

class WelcomePage extends StatefulWidget {
  final String pageTitle;

  WelcomePage({Key key, this.pageTitle}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background/dashboardbg.jpg'),
                fit: BoxFit.cover)),
        child: Center(

            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/welcomenew.png', width: 190, height: 190),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 0),
              child: Text(getTranslated(context, 'create_your_new_account_for_future_uses.'), style: logoStyle),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(bottom: 0),
              child: froyoFlatBtn(getTranslated(context,'Sign_In'), () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rotate,
                        duration: Duration(seconds: 1),
                        child: SignInPage()));
              }),
            ),
            Container(
              width: 200,
              padding: EdgeInsets.all(0),
              child: froyoOutlineBtn(getTranslated(context,'Sign_Up'), () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rotate,
                        duration: Duration(seconds: 1),
                        child: SignUpPage()));
                // Navigator.of(context).pushReplacementNamed('/signup');
              }
              ),
            ),

            Container(
              child: Center(
                  child: DropdownButton<Language>(
                iconSize: 30,
                hint: Text(getTranslated(context, 'change_language')),
                onChanged: (Language language) {
                  _changeLanguage(language);
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              e.flag,
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(e.name)
                          ],
                        ),
                      ),
                    )
                    .toList(),
              )),
            )
          ],
        )),
        //backgroundColor: bgColor,
      ),
    );
  }
}
