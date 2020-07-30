import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:price/models/place.dart';

import 'Style.dart';

class Utils {
  //Data
  static List<Place> places;
  static String getLanguage() {
    String language = ui.window.locale.languageCode;
    var spanishLanguage = language == 'es' || language == 'ca';
    if (spanishLanguage) {
      return language;
    }
    return 'en';
  }

  static parseRating(double rating) {
    return rating % 1 == 0 ? rating.round() : rating.toStringAsFixed(1);
  }

  static Widget starsIndicator(double rating, {colorText, numbers, starsSize}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RatingBar(
          initialRating: rating,
          minRating: 1,
          itemCount: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          ignoreGestures: true,
          itemSize: starsSize == null ? 24 : starsSize,
          itemPadding: EdgeInsets.all(0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Color(0XFFFADA4A),
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(width: Style.lateralPaddingValue / 2),
        numbers == null
            ? Style.bodyText(
                Utils.parseRating(rating),
                color: colorText != null ? colorText : Colors.black,
                fontSize: 14.0,
              )
            : numbers,
      ],
    );
  }
}
