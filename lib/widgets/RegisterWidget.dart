import 'package:flutter_app/localization/language_constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/auth/SignInPage.dart';
import 'package:flutter_app/shared/Styles.dart';
import 'package:flutter_app/utils/RestService.dart';
import 'package:flutter_app/widgets/RegButton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:page_transition/page_transition.dart';

class RegisterWidget extends StatefulWidget {
  RegisterWidget();
  BoardingHouse boardingHouse;
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final RestService _restService = new RestService();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  bool checkGirlsOnly = false;
  bool checkParkingOnly = false;
  bool checkAttachBathroom = false;
  bool checkKitchen = false;

  String title = '';
  String subtitle = '';
  String description = '';
  String distance = '';
  String perMonth = '';
  String keyMoney = '';
  String imageUrl = '';

  String error = '';
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  double fieldRadius = 20;
  File _imageFile;
  final picker = ImagePicker();

  Future<void> captureImage(ImageSource imageSource) async {
    final imageFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (imageFile != null) {
        _imageFile = File(imageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile(File _imageFile) async {
    String path = DateTime.now().microsecondsSinceEpoch.toString() + '.png';
    String fileName = 'BoardingHouse/${path}';
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(fileName);
    UploadTask uploadTask = ref.putFile(_imageFile);
    var url = await (await uploadTask).ref.getDownloadURL();
    setState(() {
      imageUrl = url.toString();
      print(imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildImage() {
      if (_imageFile != null) {
        return Image.file(_imageFile);
      } else {
        return Center(
          child: Text("Please upload your image here",
              style: TextStyle(fontSize: 18.0)),
        );
      }
    }

    Widget _buildActionButton({Key key, String text, Function onPressed}) {
      return Expanded(
        child: OutlineButton(
            borderSide: BorderSide(color: Colors.black),
            key: key,
            child: Text(text, style: TextStyle(fontSize: 15.0)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            //shape: StadiumBorder(),
            color: Colors.red,
            textColor: Colors.black,
            onPressed: onPressed),
      );
    }

    Widget _buildButtons() {
      return ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: 35.0,
            width: MediaQuery.of(context).size.width / 1.5,
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildActionButton(
                  key: Key('retake'),
                  text: "gallery",
                  onPressed: () => captureImage(ImageSource.gallery),
                ),
              ]));
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                      style: inputFieldTextStyle,
                      decoration: textInputDecoration.copyWith(
                        hintText: "Title",
                        hintStyle: inputFieldHintTextStyle,
                        labelStyle: TextStyle(),
                        border: inputFieldDefaultBorderStyle,
                      ),
                      validator: (val) =>
                          val == null || val.trim() == '' ? '' : null,
                      onChanged: (val) => setState(() => title = val)),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: inputFieldTextStyle,
                      decoration: textInputDecoration.copyWith(
                        hintText: "SubTitle",
                        hintStyle: inputFieldHintTextStyle,
                        border: inputFieldDefaultBorderStyle,
                      ),
                      validator: (val) =>
                          val == null || val.trim() == '' ? '' : null,
                      onChanged: (val) => setState(() => subtitle = val),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: inputFieldTextStyle,
                      maxLines: 5,
                      decoration: textInputDecoration.copyWith(
                        //contentPadding: new EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                        hintText: "Description",
                        hintStyle: inputFieldHintTextStyle,
                        border: inputFieldDefaultBorderStyle,
                      ),
                      validator: (val) =>
                          val == null || val.trim() == '' ? '' : null,
                      onChanged: (val) => setState(() => description = val),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          style: inputFieldTextStyle,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          decoration: textInputDecoration.copyWith(
                            hintText: "Distance",
                            hintStyle: inputFieldHintTextStyle,
                            border: inputFieldDefaultBorderStyle,
                          ),
                          onChanged: (val) => setState(() => distance = val),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          style: inputFieldTextStyle,
                          keyboardType: TextInputType.number,
                          decoration: textInputDecoration.copyWith(
                            hintText: "Per Month",
                            hintStyle: inputFieldHintTextStyle,
                            border: inputFieldDefaultBorderStyle,
                          ),
                          validator: (val) =>
                              val == null || val.trim() == '' ? '' : null,
                          onChanged: (val) =>
                              setState(() => perMonth = val),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          style: inputFieldTextStyle,
                          keyboardType: TextInputType.number,
                          decoration: textInputDecoration.copyWith(
                            hintText: "Key Money",
                            hintStyle: inputFieldHintTextStyle,
                            border: inputFieldDefaultBorderStyle,
                          ),
                          validator: (val) =>
                              val == null || val.trim() == '' ? '' : null,
                          onChanged: (val) =>
                              setState(() => keyMoney = val),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Girls Only",
                        style: inputFieldTextStyle,
                      ),
                      new Container(width: 50.0),
                      Checkbox(
                        value: checkGirlsOnly,
                        onChanged: (newValue) {
                          setState(() {
                            checkGirlsOnly = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Parking",
                        style: inputFieldTextStyle,
                      ),
                      new Container(width: 60.0),
                      Checkbox(
                        value: checkParkingOnly,
                        onChanged: (newValue) {
                          setState(() {
                            checkParkingOnly = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Attach Bathroom",
                        style: inputFieldTextStyle,
                      ),
                      new Container(width: 5.0),
                      Checkbox(
                        value: checkAttachBathroom,
                        onChanged: (newValue) {
                          setState(() {
                            checkAttachBathroom = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Kitchen",
                        style: inputFieldTextStyle,
                      ),
                      new Container(width: 60.0),
                      Checkbox(
                        value: checkKitchen,
                        onChanged: (newValue) {
                          setState(() {
                            checkKitchen = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Images",
                            style: h3,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      children: [
                        Expanded(child: Center(child: _buildImage())),
                      ],
                    ),
                  ),
                  _buildButtons(),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
                              title: InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => SignInPage())),
                                child: Text(
                                  "I agreed to the terms & conditions of Boarding Hub",
                                  style: inputFieldTextStyle,
                                ),
                              ),
                              value: checkBoxValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkBoxValue = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Regbutton(
                        typeText: Text(
                          "Submit",
                          style: h5,
                        ),
                        onPress: () async {
                          if (_formKey.currentState.validate() &&
                              checkBoxValue) {
                            await uploadFile(_imageFile);
                            BoardingHouse boardingHouse = new BoardingHouse(
                                title,
                                subtitle,
                                description,
                                double.parse(distance),
                                double.parse(perMonth),
                                double.parse(keyMoney),
                                imageUrl,
                                checkGirlsOnly,
                                checkParkingOnly,
                                checkAttachBathroom,
                                checkKitchen);
                            _registerBoarding(boardingHouse);
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _registerBoarding(boardingHouse) async {

    if (!_formKey.currentState.validate()) {
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text(
            getTranslated(context, 'Invalid_information'),
          ),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      );
    } else {

      _restService.registerBoarding(boardingHouse).then((val) {
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
                        type: PageTransitionType.rightToLeft,
                        child: HomePage()),
                  ),
                )
            : _scaffoldKey.currentState.showSnackBar(new SnackBar(
                content: new Text(val.data['msg']),
                backgroundColor: Colors.deepOrangeAccent,
              ));
      });
    }
  }
}
