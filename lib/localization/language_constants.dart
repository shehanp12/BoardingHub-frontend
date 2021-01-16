import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_localization.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String Sinhala = 'si';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    
    case Sinhala:
      return Locale(Sinhala, "SN");
    
    default:
      return Locale(ENGLISH, 'US');
  }
}

bool checkLanguage(BuildContext context) {
  return DemoLocalizations.of(context).checkLang();
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context).translate(key);
}
