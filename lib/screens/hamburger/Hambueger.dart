import 'package:flutter/material.dart';
import 'package:flutter_app/screens/hamburger/aboutus.dart';
import 'package:flutter_app/screens/hamburger/contactus.dart';
import 'package:flutter_app/screens/hamburger/guidelines.dart';
import 'package:flutter_app/screens/hamburger/hotline.dart';
import 'terms.dart';
import 'privacy.dart';


class MenudrawerPage extends StatelessWidget {
  final String title;

  MenudrawerPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.deepOrangeAccent, title: Text(title)),
      body: Center(child: Text('My Page1!')),
      drawer: Drawer(
        
        
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.deepOrangeAccent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),


            

            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              title: Text('About Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Pacifico')),
              leading: Icon(
                Icons.account_balance,
                color: Colors.deepOrangeAccent,
                size: 20.0,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return AboutUs();
                }));
              },
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              title: Text('Contact Us',
                  style: TextStyle(
                      color: Colors.black,
                      //height: 4.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Pacifico')),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.deepOrangeAccent,
                size: 20.0,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return ContactUs();
                }));
              },
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              title: Text('Hotline',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Pacifico')),
              leading: Icon(
                Icons.call,
                color: Colors.deepOrangeAccent,
                size: 20.0,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return Hotline();
                }));
              },
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              title: Text('Terms & Conditions',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Pacifico')),
              leading: Icon(
                Icons.warning,
                color: Colors.deepOrangeAccent,
                size: 20.0,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return TermsCondition();
                }));
              },
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              title: Text('Privacy Policy',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Pacifico')),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.deepOrangeAccent,
                size: 20.0,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return PrivacyPolicy();
                }));
              },
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              title: Text('Guidelines',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Pacifico')),
              leading: Icon(
                Icons.golf_course,
                color: Colors.deepOrangeAccent,
                size: 20.0,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return Guidelines();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
