import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../shared/Styles.dart';
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
  DateTime current;


Future<bool> popped() async{
    DateTime now = DateTime.now();
    if (current == null || now.difference(current) > Duration(seconds: 2)) {
      current = now;
      Fluttertoast.showToast(
        msg: "Press back Again To exit!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        backgroundColor: Color.fromARGB(1000, 4, 1, 0)
      );
      
      return Future.value(false);
    } else {
      Fluttertoast.cancel();
      //bool user = await checkUser();
      //if(user){
     //   SystemNavigator.pop();
     // } 
      return Future.value(true);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop:() => popped(),
    child: Scaffold(
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
              child: Text(
                  getTranslated(
                      context, 'create_your_new_account_for_future_uses.'),
                  style: logoStyle),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(bottom: 0),
              child: froyoFlatBtn('BoardingProvider', () {
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
              child: froyoOutlineBtn('Employee', () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rotate,
                        duration: Duration(seconds: 1),
                        child: SignUpPage()));
                // Navigator.of(context).pushReplacementNamed('/signup');
              }),
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
    ),);
  }
}
