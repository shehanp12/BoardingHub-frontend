import 'package:flutter/material.dart';
import 'colors.dart';
import 'styles.dart';

Container fryoTextInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted, validator}) {
  return Container(
    margin: EdgeInsets.only(top: 13),
    child: TextFormField(
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      cursorColor: primaryColor,
      style: inputFieldTextStyle,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: inputFieldHintTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle),
    ),
  );
}

Container fryoEmailInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted, validator}) {
  return Container(
    margin: EdgeInsets.only(top: 13),
    child: TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      onEditingComplete: onEditingComplete,
      keyboardType: TextInputType.emailAddress,
      cursorColor: primaryColor,
      style: inputFieldTextStyle,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: inputFieldHintTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle),
    ),
  );
}

Container fryoPasswordInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted, validator}) {
  return Container(
    margin: EdgeInsets.only(top: 13),
    child: TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      validator: validator,
      obscureText: true,
      cursorColor: primaryColor,
      style: inputFieldHintPaswordTextStyle,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: inputFieldHintPaswordTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle),
    ),
  );
}
