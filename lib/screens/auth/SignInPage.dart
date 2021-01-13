import 'package:flutter/material.dart';
import 'package:flutter_app/localization/language_constants.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/utils/RestService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/Styles.dart';
import '../../shared/Colors.dart';
import '../../shared/InputFields.dart';
import 'package:page_transition/page_transition.dart';
import 'SignUpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text(getTranslated(context,'Sign_In'),
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
                sharedPreferences.clear();
                sharedPreferences.commit();


              },
              child: Text(getTranslated(context,'Sign_Up'), style: contrastText),
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
                        Text(getTranslated(context,'Welcome_Back!'),
                            style: h3),
                        Text(getTranslated(context,'Howdy,_lets_authenticate'), style: taglineText),
                        fryoEmailInput(getTranslated(context,'Email_Address'),
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => email = val)),
                        fryoPasswordInput(getTranslated(context,'Password'),
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => password = val)),

                      ],
                    ),
                    SizedBox(height: 15,),
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
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }

  void _login(email, password) {
    if (!_formKey.currentState.validate()) {
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text(getTranslated(context,'Invalid_information'),),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      );
    }

    _restService.login(email, password).then((val)  {

      // sharedPreferences.setString("token", val.data['token']);

      val.data["success"] == true ?
      _scaffoldKey.currentState
              .showSnackBar(new SnackBar(
                content: new Text(val.data['message']),
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
              content: new Text(val.data['message']),
              backgroundColor: Colors.deepOrangeAccent,
            ));
    });
  }
}
