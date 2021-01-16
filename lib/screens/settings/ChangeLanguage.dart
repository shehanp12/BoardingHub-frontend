import 'package:flutter/material.dart';
import 'package:flutter_app/classes/language.dart';
import 'package:flutter_app/localization/language_constants.dart';
import 'package:flutter_app/main.dart';


class ChangeLanguagePage extends StatefulWidget {
  ChangeLanguagePage({Key key}) : super(key: key);
  @override
  _ChangeCountryPageState createState() => _ChangeCountryPageState();
}

class _ChangeCountryPageState extends State<ChangeLanguagePage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [    
            Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(40),
              height:MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width,
              
              child: Column(
                
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       
                          
                        Text(getTranslated(context, 'Choose language'),
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 22,
        
                          ),
                        ),
                        CloseButton()
                      ],
                    ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        _changeLanguage(Language.languageList().first);
                      },
                      child: Text(
                          Language.languageList().first.flag +
                              " " +
                              Language.languageList().first.name,
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        _changeLanguage(Language.languageList().last);
                      },
                      child: Text(
                          Language.languageList().last.flag +
                              "   " +
                              Language.languageList().last.name,
                          style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
