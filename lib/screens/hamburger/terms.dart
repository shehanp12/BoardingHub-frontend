import 'package:flutter/material.dart';
import 'package:flutter_app/localization/language_constants.dart';

class TermsCondition extends StatefulWidget {
  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(getTranslated(context,
                  'TERMS_AND_CONDITIONS'),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    
                    Text(getTranslated(context,
                        'Terms_Description'),),
                    SizedBox(
                      height: 15,
                    ),
                    Text(getTranslated(context,
                      'Advice'),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text(getTranslated(context,
                        'Advice_first_paragraph'),),
                    SizedBox(
                      height: 15,
                    ),
                    Text(getTranslated(context,
                        'Advice_second_paragraph'),),
                    SizedBox(
                      height: 15,
                    ),
                    Text(getTranslated(context,
                        'Advice_Third_paragraph'),),
                    SizedBox(
                      height: 15,
                    ),
                    Text(getTranslated(context,
                      'Copyright'),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text(getTranslated(context,
                        'Copyright_description'),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
