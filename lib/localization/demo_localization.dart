import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
 
  DemoLocalizations(this.locale);
   final Locale locale;


  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  Map<String,String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues=
    await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
     Map<String,dynamic> mappedJson=json.decode(jsonStringValues);

     _localizedValues= 
     mappedJson.map((key, value) =>MapEntry(key,value.toString()));
     
  }

   String translate(String key) {
       return _localizedValues[key];
     }

   bool checkLang() {
    if(locale.languageCode=="en"){
      return true;
    }else{
      return false;
    }
   }

    static const LocalizationsDelegate<DemoLocalizations> delegate =
    DemoLocalizationDelegate();

  
}

class DemoLocalizationDelegate extends LocalizationsDelegate<DemoLocalizations>  {
  const DemoLocalizationDelegate();


  @override
  bool isSupported(Locale locale) => ['en', 'si'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localization =new DemoLocalizations(locale);
    await localization.load();
    return localization;

  }

  @override
  bool shouldReload(DemoLocalizationDelegate old) => false;
}

