import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _primaryColor = Colors.teal;
const _backgroundColor = Colors.white;
const _foregroundColor = Colors.white;
const _darkFont = Color.fromRGBO(32, 32, 34, 1);

ThemeData buildTheme() {
  return ThemeData(
    primarySwatch: _primaryColor,
    primaryColor: _primaryColor,
    accentColor: _primaryColor,
    backgroundColor: _backgroundColor,
    cardColor: _foregroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.robotoTextTheme().apply(displayColor: _darkFont),
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
