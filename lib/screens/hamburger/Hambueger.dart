import 'package:flutter/material.dart';
import 'package:flutter_app/screens/hamburger/aboutus.dart';
import 'package:flutter_app/screens/hamburger/contactus.dart';
import 'package:flutter_app/screens/hamburger/guidelines.dart';
import 'package:flutter_app/screens/hamburger/hotline.dart';

import 'package:flutter_app/screens/hamburger/privacy.dart';
import 'package:flutter_app/screens/hamburger/terms.dart';

import 'terms.dart';
import 'privacy.dart';



class MenudrawerPage extends StatelessWidget {
  final String title;

  MenudrawerPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
                title: Text(
                  'About Us',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepOrangeAccent,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return AboutUs();
                  }));
                },
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
                title: Text('Contact Us'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepOrangeAccent,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ContactUs();
                  }));
                },
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
                title: Text('Hotlines'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepOrangeAccent,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Hotline();
                  }));
                },
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.warning,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
                title: Text('Terms & Conditions'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepOrangeAccent,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return TermsCondition();
                  }));
                },
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
                title: Text('Privacy Policy'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepOrangeAccent,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return PrivacyPolicy();
                  }));
                },
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.golf_course,
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
                title: Text('Guidelines'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepOrangeAccent,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Guidelines();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
