import 'package:flutter/material.dart';

// Colors
const Color primaryColor = Color(0xFFFF1054);
const Color secondaryColor = Color(0xFF8A7E70);
const Color errorColor = Colors.redAccent;
const Color whiteColor = Color(0xFFFFFCFC);
const Color splashColor = Colors.deepOrange;
const Color blackColor = Colors.black87;
const Color bgPrimaryColor = Color(0xFFFF7F41);
const Color bgSecondaryColor = Color(0xFF8A7E70);
const Color surfaceOnColor = Color(0xFFFF7F41);
const Color dividerColor = Color(0x000F7F41);

// Dimensions
const defaultPadding = 12.0;
const defaultMargin = 12.0;
const defaultRadius = 12.0;

// Text Styling
const TextStyle subTitleStyle = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 18,
  fontFamily: 'SharpSans',
  color: surfaceOnColor,
);

const TextStyle titleStyle = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 24,
  color: surfaceOnColor,
);

const TextStyle subHeadingStyle = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 16,
  color: whiteColor,
);

// Light Theme
ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    canvasColor: Colors.transparent,
    splashColor: splashColor,
    brightness: Brightness.dark,
    backgroundColor: Colors.blue[700],
    textTheme: TextTheme(
        subtitle1: titleStyle, subtitle2: subTitleStyle, bodyText1: subHeadingStyle),
    appBarTheme: AppBarTheme(
        color: Color(0xff1f655d),
        actionsIconTheme: IconThemeData(color: Colors.white)));

// Dark Theme.
ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  backgroundColor: Colors.blue[700]);
