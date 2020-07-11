import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _primaryColor = Colors.teal;
final _backgroundColor = Colors.white;
final _foregroundColor = Colors.white;
const _darkFont = Color.fromRGBO(32, 32, 34, 0.87);
final _baseTextTheme = GoogleFonts.robotoTextTheme();
final _textTheme = _baseTextTheme.copyWith(
  headline1: _baseTextTheme.headline1.copyWith(color: _darkFont),
  headline2: _baseTextTheme.headline2.copyWith(color: _darkFont),
  headline3: _baseTextTheme.headline3.copyWith(color: _darkFont),
  headline4: _baseTextTheme.headline4.copyWith(color: _darkFont),
  headline5: _baseTextTheme.headline5.copyWith(color: _darkFont),
  headline6: _baseTextTheme.headline6.copyWith(color: _darkFont),
  subtitle1: _baseTextTheme.subtitle1.copyWith(color: _darkFont),
  subtitle2: _baseTextTheme.subtitle2.copyWith(color: _darkFont),
  bodyText1: _baseTextTheme.bodyText1.copyWith(color: _darkFont),
  bodyText2: _baseTextTheme.bodyText2.copyWith(color: _darkFont),
  caption: _baseTextTheme.caption.copyWith(color: _darkFont),
  overline: _baseTextTheme.overline.copyWith(color: _darkFont),
  button: _baseTextTheme.button.copyWith(color: _backgroundColor),
);

ThemeData buildTheme() {
  return ThemeData(
    primarySwatch: _primaryColor,
    primaryColor: _primaryColor,
    accentColor: _primaryColor,
    backgroundColor: _backgroundColor,
    cardColor: _foregroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryTextTheme: _textTheme,
    textTheme: _textTheme,
    buttonColor: _primaryColor,
  );
}

ThemeData appTheme = ThemeData(
  primarySwatch: _primaryColor,
  primaryColor: _primaryColor,
  accentColor: _primaryColor,
  backgroundColor: _backgroundColor,
  cardColor: _foregroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.robotoTextTheme().apply(displayColor: _darkFont),
  buttonColor: _primaryColor,
);
