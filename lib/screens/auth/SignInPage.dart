import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/utils/RestService.dart';
import '../../shared/Styles.dart';
import '../../shared/Colors.dart';
import '../../shared/InputFields.dart';
import 'package:page_transition/page_transition.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final RestService _restService = new RestService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('Sign In',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignUpPage()));
              },
              child: Text('Sign Up', style: contrastText),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Welcome Back!', style: h3),
                    Text('Howdy, let\'s authenticate', style: taglineText),
                    fryoEmailInput('Email Address',
                        validator: (val) =>
                            val == null || val.trim() == '' ? '' : null,
                        onChanged: (val) => setState(() => email = val)),
                    fryoPasswordInput('Password',
                        validator: (val) =>
                            val == null || val.trim() == '' ? '' : null,
                        onChanged: (val) => setState(() => password = val)),
                  ],
                ),
                SizedBox(height:15 ),
                FlatButton(
                  onPressed: () {
                    _login(email, password);
                  },
                  color: primaryColor,
                  padding: EdgeInsets.all(13),
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward, color: white),
                )
              ],
            ),
          ),
          height: 300,

          decoration: authPlateDecoration,
        ));
  }

  void _login(email, password) {
    if (!_formKey.currentState.validate()) {
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text('Invalid information'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      );
    }

    _restService.login(email, password).then((val) {
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
                      type: PageTransitionType.rightToLeft, child: HomePage()),
                ),
              )
          : _scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(val.data['msg']),
              backgroundColor: Colors.deepOrangeAccent,
            ));
    });
  }
}
