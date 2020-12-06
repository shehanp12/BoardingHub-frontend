import 'package:flutter/material.dart';
import './colors.dart';

FlatButton froyoFlatBtn(String text, onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: white,
    color: primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

OutlineButton froyoOutlineBtn(String text, onPressed) {
  return OutlineButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: primaryColor,
    highlightedBorderColor: highlightColor,
    borderSide: BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

const LinearGradient mainButton = LinearGradient(colors: [

  Color(0xFFFFF3E0),
  Color(0xFFFF9800),
  Color(0xFFF57C00),
  
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);