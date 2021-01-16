import 'package:flutter/material.dart';
import 'package:flutter_app/localization/language_constants.dart';


class Hotline extends StatefulWidget {
  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<Hotline> {
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
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(getTranslated(context,
                  "Hotlines"),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: Offset(0, 1))
                          ]),
                      height: MediaQuery.of(context).size.height / 6,
                      child: Center(
                        
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: Offset(0, 1))
                          ]),
                      height: MediaQuery.of(context).size.height / 6,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.business,
                                      color: Colors.deepOrangeAccent,
                                      size: 40.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '',
                                ),
                                Text(getTranslated(context,
                                  'Business_Inquiries'),
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: 'Pacifico'),
                                ),
                                Text(
                                  '+94114507500',
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: 'Pacifico'),
                                ),
                                Text('')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: Offset(0, 1))
                          ]),
                      height: MediaQuery.of(context).size.height / 6,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.follow_the_signs,
                                      color: Colors.deepOrangeAccent,
                                      size: 40.0,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(getTranslated(context,
                                  'Careers'),
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: 'Pacifico'),
                                ),
                                Text(
                                  '+94114507518',
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      fontFamily: 'Pacifico'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
