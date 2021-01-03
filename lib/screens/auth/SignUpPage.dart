import 'package:flutter/material.dart';
import 'package:flutter_app/localization/language_constants.dart';
import 'package:flutter_app/models/BoardingProvider.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/utils/RestService.dart';
import '../../shared/Styles.dart';
import '../../shared/Colors.dart';
import '../../shared/InputFields.dart';
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
  String address;
  String contactNumber;
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
          title: Text(getTranslated(context,'Sign_Up'),
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignInPage()));
              },
              child: Text(getTranslated(context,'Sign_In'), style: contrastText),
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
                        Text(getTranslated(context,'Welcome_to_Boarding_Hub!'), style: h3),
                        Text(getTranslated(context,'Lets_get_started'), style: taglineText),
                        fryoTextInput(getTranslated(context,'Username'),
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => username = val)
                        ),
                        fryoTextInput(getTranslated(context,'Full_Name'),
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => fullName = val)),
                        fryoEmailInput(getTranslated(context,'Email_Address'),
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => email = val)),
                        fryoPasswordInput(getTranslated(context,'Password'),
                            validator: (val) =>
                                val == null || val.trim() == '' ? '' : null,
                            onChanged: (val) => setState(() => password = val))
                      ],
                    ),
                    SizedBox(height: 15,),
                    FlatButton(
                      onPressed: () {

                        BoardingProvider boardingProvider =
                            new BoardingProvider(
                                username, fullName, email, password,address,contactNumber);

                        _register(boardingProvider);
                      },
                      color: primaryColor,
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                      child: Icon(Icons.arrow_forward, color: white),
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
          content: new Text(getTranslated(context,'Invalid_information'),),
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
