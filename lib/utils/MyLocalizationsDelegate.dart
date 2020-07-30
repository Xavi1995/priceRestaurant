import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price/utils/Utils.dart';

import 'MyLocalizations.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();


  @override
  bool isSupported (Locale locale) => ['es', 'en','en',].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale){
    return SynchronousFuture<MyLocalizations>(MyLocalizations(Locale(Utils.getLanguage())));
  }


  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}