import 'package:flutter/material.dart';
import 'package:flutter_app/models/BoardingProvider.dart';
import 'package:flutter_app/screens/Dashboard.dart';
import 'package:flutter_app/utils/rest_service.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import 'SignInPage.dart';

class SignUpPage extends StatefulWidget {
  final String pageTitle;

  SignUpPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String username;
  String fullName;
  String email;
  String password;
  final RestService _restService = new RestService();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('Sign Up',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signin');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignInPage()));
              },
              child: Text('Sign In', style: contrastText),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Welcome to Boarding Hub!', style: h3),
                        Text('Let\'s get started', style: taglineText),
                        fryoTextInput('Username',
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => username = val)),
                        fryoTextInput('Full Name',
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => fullName = val)),
                        fryoEmailInput('Email Address',
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => email = val)),
                        fryoPasswordInput('Password',
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => password = val))
                      ],
                    ),
                    Positioned(
                      bottom: 15,
                      right: -15,
                      child: FlatButton(
                        onPressed: () {
                          // Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Dashboard()));
                          BoardingProvider boardingProvider =
                              new BoardingProvider(
                                  username, fullName, email, password);

                          _register(boardingProvider);
                        },
                        color: primaryColor,
                        padding: EdgeInsets.all(13),
                        shape: CircleBorder(),
                        child: Icon(Icons.arrow_forward, color: white),
                      ),
                    )
                  ],
                ),
              ),
              height: 450,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }

  void _register(boardingProvider) {
    if (!_formKey.currentState.validate()) {
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text('Invalid information'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      );
    }
    _restService.registerUser(boardingProvider).then((val) {
      val.data['success'] == true
          ? _scaffoldKey.currentState
              .showSnackBar(new SnackBar(
                content: new Text(val.data['msg']),
                backgroundColor: Colors.deepOrangeAccent,
              ))
              .closed
              .then(
                (_) => Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Dashboard()),
                ),
              )
          : _scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(val.data['msg']),
              backgroundColor: Colors.deepOrangeAccent,
            ));
    });
  }
}
