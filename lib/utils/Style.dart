import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class Style {
  //Colors

  static const Color primaryColor = Color(0xFF375227);
  static const Color primaryLightColor = Color(0xFF456831);
  static const Color containerColor = Color(0x807C9A82);
  static const Color backgroundColor = Color(0xFFF9F8F6);
  static const Color grayColor = Color(0xFFA5A5A5);
  static const Color locationColor = Color(0xFFE9EFF0);
  static const Color locationAccentColor = Color(0xFF78A2D2);
  static const Color healthyColor = Color(0xFFFDEEE2);
  static const Color healthyAccentColor = Color(0xFFF9D7B8);
  static const Color timeColor = Color(0xFFE9F0E9);
  static const Color timeAccentColor = Color(0xFF658C7C);
  static const Color priceColor = Color(0xFFFFFEDE);
  static const Color priceAccentColor = Color(0xFFFEE400);
  static const Color originalityColor = Color(0xFFF8DEFF);
  static const Color originalityAccentColor = Color(0xFF8D6C9F);

  //Padding

  static final EdgeInsets lateralPadding =
      EdgeInsets.symmetric(horizontal: lateralPaddingValue);
  static final double lateralPaddingValue = 16;
  static final double extraPaddingValue = 36;
  static final EdgeInsets extraFullPadding = EdgeInsets.only(
      top: extraPaddingValue,
      right: extraPaddingValue,
      left: extraPaddingValue);

  //FontSize

  static final double fontSizeSuperSmall = 12;
  static final double fontSizeSmall = 13;

  static final double fontSizeMedium = 14;
  static final double fontSizeBody = 16;
  static final double fontSizeBodyPlus = 20;
  static final double fontSizeTitleName = 38;

  //FontWeight

  static final FontWeight fontWeightLight = FontWeight.w300;

  //Radius

  static final double buttonRadius = 10;
  static final double containerRadius = 20;

  //UI

  static Icon get iconBack =>
      Platform.isIOS ? Icon(Icons.arrow_back_ios) : Icon(Icons.arrow_back);

  //AppBar

  static Widget title(
    title, {
    color,
    fontSize,
    fontWeight,
    maxLines,
    textAlign,
  }) {
    return Text(title,
        maxLines: maxLines,
        textAlign: textAlign != null ? textAlign : TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.abrilFatface(
          color: color == null ? Colors.white : color,
          fontSize: fontSize == null ? fontSizeTitleName : fontSize,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
        ));
  }

  static Widget bodyTitle(
    title, {
    color,
    fontSize,
    fontWeight,
    maxLines,
    textAlign,
    fontFamilyAbril,
    letterSpacing,
  }) {
    return Text(title,
        maxLines: maxLines,
        textAlign: textAlign != null ? textAlign : TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: fontFamilyAbril != null
            ? GoogleFonts.abrilFatface(
                color: color == null ? Colors.white : color,
                fontSize: fontSize == null ? fontSizeTitleName : fontSize,
                fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
                letterSpacing: letterSpacing != null ? letterSpacing : 0,
              )
            : GoogleFonts.montserrat(
                color: color == null ? Colors.white : color,
                fontSize: fontSize == null ? fontSizeTitleName : fontSize,
                fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
                letterSpacing: letterSpacing != null ? letterSpacing : 0,
              ));
  }

  static Widget bodyBoldText(
    title, {
    color,
    fontSize,
    maxLines,
    textAlign,
  }) {
    return Text(title,
        maxLines: maxLines,
        textAlign: textAlign != null ? textAlign : TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: color == null ? Colors.white : color,
          fontSize: fontSize == null ? fontSizeBody : fontSize,
          fontWeight: FontWeight.bold,
        ));
  }

  static Widget bodyText(title,
      {color, fontSize, fontWeight, maxLines, textAlign, overFlow, height}) {
    return Text(title,
        maxLines: maxLines,
        textAlign: textAlign != null ? textAlign : TextAlign.left,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: GoogleFonts.montserrat(
          height: height,
          color: color == null ? Colors.white : color,
          fontSize: fontSize == null ? fontSizeBody : fontSize,
          fontWeight: fontWeight == null ? FontWeight.w300 : fontWeight,
        ));
  }

  static Widget appBar(title, {textColor, leading, actions, backgroundColor}) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.abrilFatface(
          color: textColor == null ? Colors.white : textColor,
          fontSize: fontSizeBodyPlus,
        ),
      ),
      leading: leading == null ? Container() : leading,
      actions: actions == null ? null : actions,
      centerTitle: true,
      brightness: Brightness.dark,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: primaryColor),
      elevation: 0,
    );
  }

  //Buttons

  static Widget button(content, onPressed,
      {color,
      textColor,
      padding = const EdgeInsets.symmetric(vertical: 17),
      fontSize,
      fontWeight,
      borderRadiusValue}) {
    if (color == null) {
      color = primaryColor;
    }
    return FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadiusValue == null ? buttonRadius : borderRadiusValue,
        ),
      ),
      highlightColor: color.withOpacity(0.5),
      padding: padding,
      color: color,
      disabledColor: color.withOpacity(0.5),
      child: content is String
          ? Text(content,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                color: textColor,
                fontSize: fontSize == null ? fontSizeBody : fontSize,
                fontWeight: fontWeight,
              ))
          : content,
    );
  }

  static Widget signInWith(content, onPressed, {color, padding, fontweight}) {
    return InkWell(
      onTap: onPressed,
      highlightColor: color.withOpacity(0.5),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(containerRadius),
        bottomRight: Radius.circular(containerRadius),
      ),
      child: Container(
          color: containerColor,
          padding: EdgeInsets.only(right: lateralPaddingValue),
          child: content is String
              ? Text(
                  content,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: fontSizeBody,
                    color: Colors.white,
                    fontWeight: fontweight,
                  ),
                )
              : content),
    );
  }

  static Widget outlineButton(content, onPressed,
      {color,
      borderColor,
      textColor,
      padding = const EdgeInsets.symmetric(
        vertical: 17,
      ),
      fontSize,
      fontweight,
      borderRadiusValue}) {
    if (color == null) {
      color = primaryColor;
    }
    return FlatButton(
      onPressed: onPressed,
      color: color,
      highlightColor: color.withOpacity(0.5),
      padding: padding,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: content is String
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: fontSize == null ? fontSizeBody : fontSize,
                    color: textColor == null ? Colors.white : textColor,
                    fontWeight: fontweight,
                  ),
                ),
              )
            : content,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: borderColor == null ? Colors.white : borderColor,
            width: 1,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(
            borderRadiusValue == null ? buttonRadius : borderRadiusValue),
      ),
    );
  }

  static Widget textField(hint, controller, context,
      {keyboardType,
      decoration,
      textCapitalization,
      obscure,
      textInputAction,
      focusNode,
      nextFocusNode,
      suffixIcon,
      expands,
      textAlignVertical,
      enabled = true,
      fillColor,
      onChanged,
      onSubmittedCallback,
      prefixIcon}) {
    return TextField(
      keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
      textCapitalization: textCapitalization == null
          ? TextCapitalization.none
          : textCapitalization,
      autofocus: false,
      controller: controller,
      style: TextStyle(
          fontSize: 18,
          color: enabled ? Colors.black : Colors.black.withOpacity(0.6)),
      textInputAction:
          textInputAction == null ? TextInputAction.done : textInputAction,
      focusNode: focusNode,
      onSubmitted:
          textInputAction != null && textInputAction == TextInputAction.next
              ? (term) {
                  focusNode.unfocus();
                  FocusScope.of(context).requestFocus(nextFocusNode);
                }
              : onSubmittedCallback != null ? onSubmittedCallback : null,
      obscureText: obscure == null ? false : obscure,
      decoration: decoration != null
          ? decoration
          : textFieldDecoration(hint, suffixIcon, fillColor, prefixIcon),
      maxLines: expands != null && expands ? null : 1,
      expands: expands != null ? expands : false,
      textAlignVertical: textAlignVertical != null
          ? textAlignVertical
          : TextAlignVertical.center,
      textAlign: TextAlign.start,
      enabled: enabled != null ? enabled : true,
      onChanged: onChanged != null ? onChanged : null,
    );
  }

  static InputDecoration textFieldDecoration(
      hint, suffixIcon, color, prefixIcon) {
    return InputDecoration(
        suffixIcon: suffixIcon == null ? null : suffixIcon,
        filled: true,
        fillColor: color,
        hintText: hint,
        prefixIcon: prefixIcon != null ? prefixIcon : null,
        hintMaxLines: 5,
        hintStyle: TextStyle(fontSize: 13),
        contentPadding: EdgeInsets.fromLTRB(18.0, 12.0, 10.0, 18.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(containerRadius),
          borderSide: BorderSide(color: Colors.transparent, width: 0.8),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(containerRadius),
          borderSide: BorderSide(color: Colors.transparent, width: 0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(containerRadius),
          borderSide: BorderSide(color: Colors.transparent, width: 0.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(containerRadius),
          borderSide: BorderSide(color: Colors.red, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(containerRadius),
          borderSide: BorderSide(color: Colors.red, width: 0.5),
        ),
        alignLabelWithHint: true);
  }
}
