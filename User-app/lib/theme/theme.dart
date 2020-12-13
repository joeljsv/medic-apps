import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
  static const _lightFillColor = Colors.black;

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        colorScheme: appColor, textTheme: textTheme, appBarTheme: appbartheme);
  }

// App Bar Theme**********************************
  static AppBarTheme appbartheme = AppBarTheme(
    color: appColor.primary,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
  );

  // /******Color Sheme******************** */
  static ColorScheme appColor = ColorScheme(
    primary: Color(0xFF1852EF),
    primaryVariant: Color(0xFF0739E8),
    secondary: Color(0xFFCBD6F2),
    secondaryVariant: Color(0xFFded9fb),
    background: Color(0xFFA3B4CE),
    surface: Color(0xFFF6F8FA),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.redAccent,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFFdd9763),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

//  ***********Text Theme

  static TextTheme textTheme = TextTheme(
    headline4: GoogleFonts.roboto(
      fontWeight: _bold,
      fontSize: 25.0,
    ),
    headline1: GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
      color: Colors.black,
    ),
    headline2: GoogleFonts.alata(),
    headline3: GoogleFonts.caveat(),
    caption: GoogleFonts.roboto(fontWeight: _bold, fontSize: 18.0),
    headline5: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 25,
      letterSpacing: 5,
    ),
    bodyText2: GoogleFonts.roboto(
      fontWeight: FontWeight.w800,
      letterSpacing: 5,
      fontSize: 30,
      color: AppTheme.appColor.primary,
    ),
    subtitle2: GoogleFonts.roboto(
      fontWeight: _medium,
      fontSize: 12.0,
    ),
    subtitle1: GoogleFonts.roboto(
      fontWeight: _medium,
      fontSize: 14.0,
    ),
    overline: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 25,
    ),
    headline6: GoogleFonts.roboto(
      // fontWeight: _bold,
      fontSize: 16.0,
    ),
    button:
        TextStyle(fontWeight: _semiBold, fontSize: 14.0, color: Colors.white),
  );
}
