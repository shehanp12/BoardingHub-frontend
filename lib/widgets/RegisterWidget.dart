import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:flutter_app/screens/auth/SignInPage.dart';
import 'package:flutter_app/shared/Styles.dart';
import 'package:flutter_app/widgets/RegButton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class RegisterWidget extends StatefulWidget {
  RegisterWidget();
  BoardingHouse boardingHouse;
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;

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
    Reference ref = storage.ref().child(fileName + path);
    UploadTask uploadTask = ref.putFile(_imageFile);
    await uploadTask.whenComplete(() async =>
        await storage.ref().child(fileName).getDownloadURL().then((fileURL) {
          FireImage image = FireImage(path, fileURL);
          List<FireImage> list = List<FireImage>();
          list.add(image);
          widget.boardingHouse.images = list;
          return 1;
        }));
  }

  @override
  Widget build(BuildContext context) {
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

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
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
                    validator: (val) => val.isEmpty ? '' : null,
                    //onChanged: (val) => setState(() => fname = val),
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: inputFieldTextStyle,
                      decoration: textInputDecoration.copyWith(
                        hintText: "Price(Rs)",
                        hintStyle: inputFieldHintTextStyle,
                        border: inputFieldDefaultBorderStyle,
                      ),
                      validator: (val) => val.isEmpty ? '' : null,
                      //onChanged: (val) => setState(() => uname = val),
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
                        hintText: "Discription",
                        hintStyle: inputFieldHintTextStyle,
                        border: inputFieldDefaultBorderStyle,
                      ),
                      validator: (val) => val.isEmpty ? '' : null,
                      //onChanged: (val) => setState(() => email = val),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Row(
                    children: <Widget>[
                      Text(
                        "Close to",
                        style: inputFieldTextStyle,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          style: inputFieldTextStyle,
                          decoration: textInputDecoration.copyWith(
                            hintText: "University",
                            hintStyle: inputFieldHintTextStyle,
                            border: inputFieldDefaultBorderStyle,
                          ),
                          validator: (val) => val.isEmpty ? '' : null,
                          //onChanged: (val) => setState(() => uname = val),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextFormField(
                          style: inputFieldTextStyle,
                          decoration: textInputDecoration.copyWith(
                            hintText: "Town",
                            hintStyle: inputFieldHintTextStyle,
                            border: inputFieldDefaultBorderStyle,
                          ),
                          validator: (val) => val.isEmpty ? '' : null,
                          //onChanged: (val) => setState(() => uname = val),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Girls Only",
                        style: inputFieldTextStyle,
                      ),
                      new Container(width: 50.0),
                      Checkbox(
                        value: checkBoxValue1,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue1 = newValue;
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
                        value: checkBoxValue2,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue2 = newValue;
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
                        value: checkBoxValue3,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue3 = newValue;
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
                        value: checkBoxValue4,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue4 = newValue;
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
                        //Expanded(child: Center(child: _buildImage())),
                      ],
                    ),
                  ),
                  _buildButtons(),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Contact Details",
                            style: h3,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: inputFieldTextStyle,
                      decoration: textInputDecoration.copyWith(
                        hintText: "Phone Number",
                        hintStyle: inputFieldHintTextStyle,
                        border: inputFieldDefaultBorderStyle,
                      ),
                      //onChanged: (val) => setState(() => vehicleNumber = val),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: inputFieldTextStyle,
                      decoration: textInputDecoration.copyWith(
                        hintText: "Address",
                        hintStyle: inputFieldHintTextStyle,
                        border: inputFieldDefaultBorderStyle,
                      ),
                      validator: (val) => val.isEmpty ? '' : null,
                      //onChanged: (val) => setState(() => address = val),
                    ),
                  ),
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
                          await uploadFile(_imageFile);
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
}
