import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const Color primaryColor = Color(0xFF6200EE);
const Color primaryVariantColor = Color(0xFF3700B3);
const Color secondaryColor = Color(0xFF03DAC6);
const Color secondaryVariantColor = Color(0xFF018786);
const Color backgroundColor = Color(0xFFFFFFFF);
const Color surfaceColor = Color(0xFFFFFFFF);
const Color errorColor = Color(0xFFB00020);
const Color onPrimaryColor = Color(0xFFFFFFFF);
const Color onSecondaryColor = Color(0xFF000000);
const Color onBackgroundColor = Color(0xFF000000);
const Color onSurfaceColor = Color(0xFF000000);
const Color onErrorColor = Color(0xFF000000);
const Color dividerColor = Color(0xFFFF7F41);

// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 24.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 12.0;
const double kSpaceL = 16.0;

// Spacing
const double kIconS = 24.0;
const double kIconM = 36.0;
const double kIconL = 48.0;

// Animation
const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);

// Text Styling

TextStyle headline2 = GoogleFonts.raleway(
  textStyle: TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.normal,
  ),
);
const TextStyle headline3 = TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.normal,
);
const TextStyle headline4 = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.normal,
);
const TextStyle headline5 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.normal,
);
const TextStyle headline6 = TextStyle(
  fontSize: 20,
  letterSpacing: 0.15,
  fontWeight: FontWeight.w700,
);
const TextStyle body1 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
const TextStyle body2 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
);
const TextStyle button = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);
const TextStyle caption = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
);
const TextStyle subTitle1 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
const TextStyle subTitle2 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
);
const TextStyle overline = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

// Light Theme
ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    secondaryHeaderColor: secondaryColor,
    canvasColor: Colors.transparent,
    brightness: Brightness.dark,
    errorColor: errorColor,
    backgroundColor: backgroundColor,
    textTheme: const TextTheme(
      subtitle1: subTitle1,
      subtitle2: subTitle2,
      bodyText1: body1,
      bodyText2: body2,
      caption: caption,
      overline: overline,
      headline6: headline6,
      headline5: headline5,
      headline4: headline4,
      headline3: headline3,
    ),
    inputDecorationTheme: InputDecorationTheme(),
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        actionsIconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor));

// Dark Theme.
ThemeData darkTheme = ThemeData.dark()
    .copyWith(brightness: Brightness.dark, backgroundColor: Colors.blue[700]);
