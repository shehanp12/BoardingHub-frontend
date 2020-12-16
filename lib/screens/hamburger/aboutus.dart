import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutUs> {
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
                  'About Us',
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
                        'Boarding Hub is to help university students to manage their hostel needs in a busy learning style. And this can also be used to manage boarding advertisements and renting houses for university students easily, effectively and reliably. So, our main objective is to build a mobile application for to select their boarding needs online in a reliable and user-friendly environment. The students will be able to select their boarding houses or rooms and boarding houses owners have the benefit of doing their business to a large group of customers.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Our Vision",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text("Problem-Solving & helps to university students to manage their hostel needs in a busy learning style THROUGH TECHNOLOGY."),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Our Mission",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text("To offer the Benefit of Digital Technologies to university students through Localized Digital Innovations.")
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
