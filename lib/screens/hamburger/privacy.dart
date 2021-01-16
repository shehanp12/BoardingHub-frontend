import 'package:flutter/material.dart';
import 'package:flutter_app/localization/language_constants.dart';


class PrivacyPolicy extends StatefulWidget {
  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<PrivacyPolicy> {
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
              
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Text(getTranslated(context,
                        'USER_PRIVACY'),),
                    SizedBox(
                      height: 15,
                    ),
                    Text(getTranslated(context,
                      'Scope_and_Application'),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text(getTranslated(context,'scope'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(getTranslated(context,
                      'Call_and_SMS_Data'),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text(getTranslated(context,'Data'),)
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
