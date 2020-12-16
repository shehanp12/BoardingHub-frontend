import 'package:flutter/material.dart';


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
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'USER PRIVACY STATEMENT',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Text(
                        'Bording Hub Solutions (Lanka) Private Limited (DMSL) collects information about you when you use our Bording Hub User App, websites, and other online products and services (collectively, the “Services”) and through other interactions and communications you have with us. This Privacy Statement applies to information collected and used by DMSL.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Scope and Application",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text("This Privacy Statement (“Statement applies to all persons who use the Bording Hub User App or Services to request transportation, delivery, or other on-demand services (“Users”). It  does not apply to information we collect from or about service providers who use the Bording Hub platform under license ( collectively “Mobility Service Providers”). If you interact with the Services as both, User and a Mobility Service Provider, the respective privacy statements will apply to your different interactions."),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Call and SMS Data",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text("Our Services facilitate communications between Users and Mobility Services Providers. In connection with facilitating this service, we receive call data, including the date and time of the call or SMS message, the parties’ phone numbers, and the content of the SMS message.")
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
