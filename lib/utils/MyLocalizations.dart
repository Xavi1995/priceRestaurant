import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:price/utils/MyLocalizationsDelegate.dart';
import 'dart:async';

import 'MyLocalizationsDelegate.dart';
import 'Utils.dart';

class MyLocalizations {
  MyLocalizations(this.locale);

  Locale locale = Locale(Utils.getLanguage());

  static Map<String, Map<String, String>> _localizedValues = {
    "es": {
      "app_name": "YourPlan",
    },
  };

  String translate(key) {
    return _localizedValues[Utils.getLanguage()][key];
  }

  static String of(BuildContext context, String key) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations)
        .translate(key);
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'ca',
        'es',
        'en',
      ].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(MyLocalizations(locale));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
